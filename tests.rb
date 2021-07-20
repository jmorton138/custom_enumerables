require_relative 'lib/custom_enumerables.rb'

numbers = [1, 2, 3, 4, 3, 6]

puts "my_each vs. each"
numbers.my_each { |item| puts item }
numbers.each { |item| puts item}

puts "my_each_with_index vs. each_with_index"
numbers.my_each_with_index do  |item, index|
    puts item
    puts index
end
numbers.each_with_index do |item, index|
    puts item
    puts index
end

puts "my_select vs. select"
puts numbers.my_select { |item| item >= 2 }
puts numbers.select { |item| item >= 2 }

puts "my_all? vs. all"
puts numbers.my_all? { |item| item >= 2 }
puts numbers.all? { |item| item >= 2 }

puts "my_any? vs. any?"
puts numbers.my_any? { |item| item >= 2 }
puts numbers.any? { |item| item >= 2 }

puts "my_none? vs. none?"
puts numbers.my_none? { |item| item >= 2 }
puts numbers.none? { |item| item >= 2 }

puts "my_count vs. count"
puts numbers.my_count(3)
puts numbers.count(3)

puts "my_map vs. map"
puts numbers.my_map {|item| item + 1}
puts numbers.map {|item| item + 1}

puts "my_inject vs. inject"
puts numbers.my_inject {|sum, num| sum + num}
puts numbers.inject {|sum, num| sum + num}

puts "multiply_els method"
multiply_els([2,4,5])

a_proc = Proc.new { |item| item + 5 }

puts "my_map with proc"
puts numbers.my_map(a_proc)
puts "my_map with block"
puts numbers.my_map { |item| item + 1 }
puts "my_map with proc and block"
puts numbers.my_map(a_proc) { |item| item + 1 }