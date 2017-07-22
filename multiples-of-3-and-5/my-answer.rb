#Problem: If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.

num = ARGV[0].to_i

def power_of_3(int)
  int if int % 3 == 0
end

def power_of_5(int)
  int if int % 5 == 0
end

def return_num(int)
  power_of_3(int) || power_of_5(int)
end

def return_sum_array(int)
  array = []
  (1..int-1).map {|e|
    array.push(return_num(e))
  }
  array.compact.sum
end

puts return_sum_array(num)
