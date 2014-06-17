#!/usr/bin/env ruby
#
# monty-hall problem
#
require 'io/console'

DEBUG = false 

# init game's start
ARRAY_INIT = [0,0,1]

correct = 0
wrong = 0

1000000.times do |t|
  # sort array randomly
  doors = ARRAY_INIT.sort_by{ rand }
  puts doors.inspect if DEBUG

  # simulate user's choice
  choice = rand(3)
  puts choice.inspect if DEBUG

  # simulate anchor's choice
  index_0_doors = []

  doors.each_with_index do |door, i|
    if i != choice && door != 1
      index_0_doors << i
    end
  end

  puts index_0_doors.inspect if DEBUG
  anchors_choice = index_0_doors[rand(index_0_doors.size)]
  puts anchors_choice if DEBUG

  # take doors without anchor's choice
  rest_doors = []
  rest_doors << doors[choice]
  doors.each_with_index do |door, i|
    if i != anchors_choice && i != choice
      rest_doors << door
    end
  end

  puts rest_doors.inspect if DEBUG

  # make last users's choice(rest_doors[0] - always user's decision, rest_doors[1] - always choose another door)
  last_choice = rest_doors[1]

    if last_choice == 1
    correct += 1
  else
    wrong +=1
  end

end

puts "Correct: #{correct}"
puts "Wrong: #{wrong}"
