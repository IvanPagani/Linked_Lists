# frozen_string_literal: true

require_relative 'lib/linkedlist'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts 'List after appending:'
puts list
puts "\n#{'-' * 90}\n\n"

list.prepend('tiger')
puts "List after prepending 'tiger':"
# puts will implicitly call to_s method
# Since I defined a custom to_s, it'll be called
puts list
puts "\n#{'-' * 90}\n\n"

puts "Size of the list: #{list.size}"
puts "\n#{'-' * 90}\n\n"

puts "Head of the list: #{list.head.value}"
puts "Tail of the list: #{list.tail.value}"
puts "\n#{'-' * 90}\n\n"

puts "Value at index 0: #{list.at(0).value}"
puts "Value at index 3: #{list.at(3).value}"
puts "Value at index 10: #{list.at(10).inspect}"
puts "\n#{'-' * 90}\n\n"

puts "Popped: #{list.pop.value}"
puts list
puts "\n#{'-' * 90}\n\n"

puts "Contains 'cat'? #{list.contains?('cat')}"
puts "Contains 'dragon'? #{list.contains?('dragon')}"
puts "\n#{'-' * 90}\n\n"

puts "Index of 'hamster': #{list.find('hamster')}"
puts "Index of 'dragon': #{list.find('dragon').inspect}"
puts "\n#{'-' * 90}\n\n"

puts "Inserting 'lizard' at index 2:"
list.insert_at('lizard', 2)
puts list
puts "\n#{'-' * 90}\n\n"

puts "Inserting 'crab' at index 0 (new head):"
list.insert_at('crab', 0)
puts list
puts "\n#{'-' * 90}\n\n"

puts "Trying to insert 'ghost' at index 10:"
puts "Result: #{list.insert_at('ghost', 10).inspect}"
puts list
puts "\n#{'-' * 90}\n\n"

puts 'Removing element at index 2:'
puts "Removed: #{list.remove_at(2).value}"
puts list
puts "\n#{'-' * 90}\n\n"

puts 'Removing element at index 0 (head):'
puts "Removed: #{list.remove_at(0).value}"
puts list
puts "\n#{'-' * 90}\n\n"

puts 'Trying to remove element at index 10:'
puts "Removed: #{list.remove_at(10).inspect}"
puts list
puts "\n#{'-' * 90}\n\n"
