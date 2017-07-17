require 'prime'
limit = ARGV[0].to_i
puts (2..limit).select(&:prime?).inject(:+)
