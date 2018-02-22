#!/usr/bin/ruby
# Ruby interactive bot, hacked apart mercilessly from lugbot source

require 'rubygems'
require './botdb'

DBFILE = "knowledge.dat"
myDB = DB.new(DBFILE)

rand_topic = 100

myDB.load

lcount = 0

while lcount == 0 do
  print "Input: "
  input = gets 
  puts "Caught input: #{input}"
  stermstring = input.downcase
  puts "Asked: #{stermstring}"
  response = myDB.query(stermstring)
  puts "-------------------"
  puts "langbot: #{response}" 
end
