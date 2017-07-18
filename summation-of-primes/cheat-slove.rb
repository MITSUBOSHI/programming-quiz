#Problem: The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#Find the sum of all the primes below two million.
require 'prime'
limit = ARGV[0].to_i
puts (2..limit).select(&:prime?).inject(:+)
