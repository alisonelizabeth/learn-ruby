# start making a ticket with Object.new

# Explain classes

# Brief explanation of new -> initialize

require 'date'

Ticket = Class.new do
  def initialize(wb1, wb2, wb3, wb4, wb5, pb, date)
    @wb1 = wb1
    @wb2 = wb2
    @wb3 = wb3
    @wb4 = wb4
    @wb5 = wb5
    @pb  = pb
    @date = date
  end
end

ticket1 = Ticket.new(2, 22, 19, 45, 26, 24, Date.today)
ticket2 = Ticket.new(2, 35, 26, 9, 47, 11, Date.today)

# explain Struct in passing
