#Problem: The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#Find the sum of all the primes below two million.
limit = ARGV[0].to_i
@range = Range.new(2, limit)
@array = []

def root(int)
  Math.sqrt(int.to_f).to_i
end

def goodbye_even_num(range)
  return range.to_a.delete_if{|n| n.even? unless n == 2 }
end

def goodbye_3_power(range)
  return range.to_a.delete_if{|n| n % 3 == 0 unless n == 3 }
end

def goodbye_5_power(range)
  return range.to_a.delete_if{|n| n % 5 == 0 unless n == 5 }
end

def goodbye_7_power(range)
  return range.to_a.delete_if{|n| n % 7 == 0 unless n == 7 }
end

def sorted_range_to_array(range)
  @array = goodbye_7_power(goodbye_5_power(goodbye_3_power(goodbye_even_num(range)))).to_a
end

def goodbye_not_prime_num(array)
  delete_array = []
  array.to_a.map {|n|
    Range.new(11, root(n)).to_a.map {|i|
      if (n % i == 0)
        delete_array.push(n)
        break
      end
    }
  }
  return array.to_a.delete_if{|n| delete_array.include?(n)}
end

def showup_prime_num(range)
  goodbye_not_prime_num(sorted_range_to_array(range))
end

def sum_prime_num(array)
  showup_prime_num(@range).inject(:+)
end

puts sum_prime_num(@range)
