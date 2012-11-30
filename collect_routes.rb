#!/usr/bin/env ruby

require 'bundler/setup'
require 'septa'

all_buses = [
  1, 2, 3, 4, 5, 6,
  7, 8, 9, 12, 14, 16,
  17, 18, 19, 20, 21, 21,
  23, 24, 25, 26, 27, 28,
  29, 30, 31, 32, 33, 35, 
  37, 38, 39, 40, 42, 44, 
  46, 47, '47m', 48, 50, 52,
  53, 54, 55, 56, 57, 58,
  59, 60, 61, 62, 65, 66, 
  67, 68, 70, 71, 73, 75,
  77, 78, 79, 80, 84, 88, 
  89, 'G', 'H', 'XH']

current_snapshot = all_buses.map do |bus|
  Septa::Bus.new(bus).bus_locations
end.flatten.compact

puts current_snapshot
