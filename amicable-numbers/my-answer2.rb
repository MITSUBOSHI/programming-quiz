#Problem: Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10000.

upper_limit = ARGV[0].to_i

def proper_divisors(int)
  divisors = [1]
  limit = Math.sqrt(int).ceil

  2.step(limit, 1) do |n|
    if int % n == 0
      divisors.push(n)
      divisors.push(int/n)
    end
  end
  return divisors.uniq.sort
end

def sum_proper_divisors(int)
  proper_divisors(int).sum
end

def check_amicable(int, list)
  if list.include?(int)
    return []
  else
    array = []
    sum = sum_proper_divisors(int)

    if(sum != int && sum_proper_divisors(sum) == int)
      array.push(int)
      array.push(sum)
    end
    return array
  end
end

list = []

(2..upper_limit).map {|n|
  amicable_numbers = check_amicable(n, list)
  amicable_numbers.each{|i| list.push(i)} unless amicable_numbers.empty?
}

puts list.sum
