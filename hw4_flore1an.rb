#!/usr/bin/env ruby

# hw_4 FizzBuzz ruby
# Author: Audra Flores
# Created: 21March2016
# Modified: 25March2016
# Changes: made array, fixed getters and setters, and string override


class FizzBuzz

  def initialize(x=0)
    self.int_num =x
  end

  def to_s
    "The number is #@int_num and the string is #@str_fb"
  end

  def int_num=(int_set)
    raise TypeError if not int_set.is_a? Numeric
    @int_num = int_set
    self.str_fb = int_set
  end

  def int_num
    return@int_num
  end

  def str_fb=(int_num)
    #@str_fb = int_num
    if int_num % 3 == 0 and int_num % 5 == 0
      @str_fb = 'FizzBuzz'
    elsif int_num % 3 == 0
      @str_fb ='Fizz'
    elsif int_num % 5 == 0
      @str_fb = 'Buzz'
    else
      @str_fb = int_num.to_s
    end
  end

  def str_fb
    return@str_fb
  end

end

def main

  myArray= Array.new


  for i in 0..50

    fizzBuzz = FizzBuzz.new(i)
    myArray.push(fizzBuzz)
  end

  myArray.each do |i|
    puts i
  end

end

main if __FILE__ == $0