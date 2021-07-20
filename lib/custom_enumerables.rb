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

    def my_map(a_proc = nil, &a_block)
        if block_given?
            block = a_block
        else
            block = a_proc
        end
        new_array = []
        for i in self
            new_array << block.call(i)
        end
        new_array
    end

    def my_inject(var = nil)
        if var != nil
            sum = var
        else
            sum = self[0]  
        end
        self.my_each_with_index do |i, index|
            unless index == 0 && var == nil
                sum = yield(sum, i)
            end 
        end
        sum
    end


end

def multiply_els(args)
    p args.my_inject {|sum, num| sum * num}
end








