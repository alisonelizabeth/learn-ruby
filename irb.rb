# gem install wirble
# require 'wirble'
# Wirble.init
# Wirble.colorize

# Everything is an expression
# Everything is an object

5 # => 5
42.0 # => 42.0
"Hello" # => "Hello"
[1, 2, 3] # => [1, 2, 3]
if true
  "hello"
end

# Objects receive messages

"six".send :upcase # => "SIX"
5.send :+, 9 # => 14
17.send :nil? # => false

# All objects have a class (and classes are objects)

5.send :class # => Fixnum
4.0.send :class # => Float
["Jake", "is", "strange"].send :class # => Array

# Assignment

one = 1 # => 1
one # => 1
one = 7 # => 7
one # => 7

# My very own object

obj = Object.send :new
obj.send :say_hello

# (objects usually respond to messages with a corresponding method)
def obj.say_hello
  Kernel.puts "Hello"
end

obj.send :say_hello
obj.say_hello

# Explain dot syntax
# Explain Kernel.puts
# Explain arguments

def obj.say_anything(thing)
  puts thing
end

obj.say_anything "In Your Eyes"

obj.methods(false)

# I want to store a greeting
obj.greeting = "Bonjour" # => undefined method `greeting='

# A brief tangent for programmers, assignment is method
def obj.greeting=(greeting)
  puts "*;.* MAKES A RUDE NOISE *;.*"
end

# say_hello still returns Hello

def obj.greeting=(greeting)
  @greeting = greeting
end

obj.greeting = "Bonjour!"

def obj.say_hello
  puts @greeting
end

obj.say_hello
