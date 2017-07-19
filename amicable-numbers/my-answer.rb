#Problem: Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10000.

upper_limit = ARGV[0].to_i

def proper_divisors(int)
  divisors = []
  n = int > 3 ? int / 2 : 2
  loop{
    divisors.push(n) if int % n == 0
    break if n == 1
    n -= 1
  }
  return divisors
end

def sum_proper_divisors(int)
  proper_divisors(int).sum
end

def all_sum_proper_divisors(int)
  all_sum_divisors = {}
  (1..int).each do |i|
     all_sum_divisors.store(i,sum_proper_divisors(i))
   end
   all_sum_divisors.delete_if {|_, sum| sum == 1}
   return all_sum_divisors
end

def amicable_numbers(int)
  array = []
  all_sum_proper_divisors(int).each do |k,v|
    all_sum_proper_divisors(int).select {|key, value| array.push(key, k) if k != key && value == v }
  end
  array.uniq
end

def sum_amicable_numbers(int)
  amicable_numbers(int).sum
end

puts sum_amicable_numbers(upper_limit)
