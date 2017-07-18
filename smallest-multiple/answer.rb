#Problem: 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
@limit = ARGV[0].to_i
@num = 0

def is_dividable_by_all(limit, n)
  (1..limit).map{|i|
    return false if n % i != 0
  }
  return true
end

def find_smallest_multiple
  loop{
    @num += 1
    if is_dividable_by_all(@limit, @num)
      puts @num
      break
    end
  }
end

find_smallest_multiple
