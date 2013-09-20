require 'date'
require 'pp'

BALLS = [:wb1, :wb2, :wb3, :wb4, :wb5, :pb]
WB_LIMIT = 59
PB_LIMIT = 35

Ticket = Struct.new(*BALLS, :date)

TicketCollection = Class.new do
  def initialize(tickets=[])
    @tickets = tickets
  end

  def hottest
    hottest = @tickets.inject(Hash.new(Date.today)) do |by_date, t|
      BALLS.each do |b|
        by_date[t[b]] = t.date if t.date < by_date[t[b]]
      end

      by_date
    end.sort_by {|num, date| date}.take(5).map {|num, date| num}.sort
    Ticket.new *hottest
  end

  def self.from_file(filename)
    tickets = []
    File.open(filename, 'r').each_line do |line|
      fields = line.split
      date = Date.strptime(fields[0], '%m/%d/%Y')
      numbers = fields[1..6].map(&:to_i)
      tickets << Ticket.new(*numbers, date)
    end

    self.new(tickets)
  end
end
