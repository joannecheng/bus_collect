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
  89, 'G', 'H', 'XH', 'J',
  'K', 'L', 'R', 'LUCY',
  90, 91, 92, 93, 94, 95,
  96, 97, 98, 99, 103, 104,
  105, 106, 107, 108, 109,
  110, 111, 112, 113, 114,
  115, 116, 117, 118, 119, 
  120, 123, 124, 125, 126,
  127, 128, 129, 130, 131,
  132, 133, 139, 150, 201,
  204, 205, 206, 310]

current_snapshot = all_buses.map do |bus|
  Septa::Bus.new(bus).bus_locations
end.flatten.compact

f = File.new("#{File.dirname(__FILE__)}/data/#{Time.now.to_i}.txt", "w")
f.write current_snapshot
f.close
