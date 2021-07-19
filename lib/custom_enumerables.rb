module Enumerable
    def my_each
        for i in self
            yield i
        end
    end

    def my_each_with_index
        counter = 0
        for i in self
            yield i, counter
            counter +=1
        end
    end

    def my_select
        selected =[]
        return_values = []
        for i in self
            selected << yield(i)
            if selected.last == true
                return_values << i
            end
        end
        return_values
    end

    def my_all?
        selected =[]
        return_values = []
        for i in self
            selected << yield(i)
            if selected.last == true
                return_values << i
            end
        end
        if return_values.length == selected.length
            return true
        else
            return false
        end 
    end

    def my_any?
        selected =[]
        return_values = []
        for i in self
            selected << yield(i)
            if selected.last == true
                return_values << i
            end
        end
        if return_values.length < 0
            return true
        else
            return false
        end 
    end

    def my_none?
        selected =[]
        return_values = []
        for i in self
            selected << yield(i)
            if selected.last == true
                return_values << i
            end
        end
        if return_values.length == 0
            return true
        else
            return false
        end 
    end

    def my_count(block = nil)
        count = 0
        if block != nil
           for i in self
                if i == block
                    count += 1
                end
            end
        else
            for i in self
                count += 1
            end
        end
        count
    end
end

#puts "my_each vs. each"
numbers = [1, 3, "steve", 4, 3, 6]
# numbers.my_each { |item| puts item }
# numbers.each { |item| puts item}

# puts "my_each_with_index vs. each_with_index"
# numbers.my_each_with_index do  |item, index|
#     puts item
#     puts index
# end

# numbers.each_with_index do |item, index|
#     puts item
#     puts index

# end
# puts "my select"
# puts numbers.my_select { |item| item >= 2 }

# puts "select"
# puts numbers.select { |item| item >= 2 }

#puts numbers.count(3)
puts numbers.my_count("steve")
