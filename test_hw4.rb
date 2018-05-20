#!/usr/bin/env ruby


require 'test/unit'
require 'stringio'
Dir.glob('./hw4_*.rb'){|hw_file| require hw_file}
$VERBOSE = nil
class FizzBuzzTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @obj_fb = FizzBuzz.new()
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    @obj_fb = nil
  end

  #Tests are worth 4 points each
  # Test that the int_num instance variable is of type Fixnum
  def test_int_num_fixnum
    assert_instance_of Fixnum, @obj_fb.int_num,
                       "Incorrect type for int_num.\nExpected type Interger got type #{@obj_fb.int_num.class}"
  end

  #Test that the int_num instance variable defaults to 0
  def test_int_num_is_zero
    assert_equal  0, @obj_fb.int_num, "Incorrect default for int_num.\nExpected 0 got #{@obj_fb.int_num}"
  end

  #Test that the str_fb instance variable is a string
  def test_str_fb_is_string
    assert_instance_of String, @obj_fb.str_fb,
                       "Incorrect type for str_fb.\nExpected type String got type #{@obj_fb.str_fb.class}"
  end

  #Test that the str_fb instance variable defaults to "FizzBuzz"
  def test_str_fb_is_string_zero
    assert_equal  "FizzBuzz", @obj_fb.str_fb, "Incorrect default for str_fb.\nExpected \"FizzBuzz\" got \"#{@obj_fb.str_fb}\""
  end

  #Test for raise of type error when setting int_num to string
  def test_int_num_takes_only_number
    assert_raise TypeError do
      @obj_fb.int_num="v"
    end
  end

  #Test multiple of 3 results in instance attribute str_fb being set to Fizz
  def test_str_fb_three
    @obj_fb.int_num = 42
    assert_equal  "Fizz", @obj_fb.str_fb, "Incorrect value for str_fb.\nExpected \"Fizz\" got \"#{@obj_fb.str_fb}\""
  end

  #Test multiple of 5 results in instance attribute str_fb being set to Buzz
  def test_str_fb_five
    @obj_fb.int_num = 10
    assert_equal  "Buzz", @obj_fb.str_fb, "Incorrect value for str_fb.\nExpected \"Buzz\" got \"#{@obj_fb.str_fb}\""
  end

  #Test multiple of 3 and 5 results in instance attribute str_fb being set to FizzBuzz
  def test_str_fb_three_five
    @obj_fb.int_num = 3000
    assert_equal  "FizzBuzz", @obj_fb.str_fb,
                  "Incorrect value for str_fb.\nExpected \"FizzBuzz\" got \"#{@obj_fb.str_fb}\""
  end

  #Test not multiple of 3 or 5 results in instance attribute str_fb being set to string of number
  def test_str_fb_not_three_five
    @obj_fb.int_num = 8675309
    assert_equal  "8675309", @obj_fb.str_fb,
                  "Incorrect value for str_fb.\nExpected \"8675309\" got \"#{@obj_fb.str_fb}\""
  end

  #Test the to string override
  def test_to_string
    assert_equal  "The number is 0 and the string is FizzBuzz", @obj_fb.to_s,
                  "Incorrect to string.\nExpected \"The number is 0 and the string is FizzBuzz\" got \"#{@obj_fb.to_s}\""
  end

  #Test is worth 10 points
  #Test that main outputs the correct strings
  def test_main
    #Redirect $stdout to a variable
    strIO_cap = StringIO.new
    $stdout = strIO_cap
    #Capture the output of main
    main
    #Return $stdout to normal
    $stdout = STDOUT
    assert_equal "The number is 0 and the string is FizzBuzz\nThe number is 1 and the string is 1\nThe number is 2 " \
                 "and the string is 2\nThe number is 3 and the string is Fizz\nThe number is 4 and the string is 4\n" \
                 "The number is 5 and the string is Buzz\nThe number is 6 and the string is Fizz\nThe number is 7 and" \
                 " the string is 7\nThe number is 8 and the string is 8\nThe number is 9 and the string is Fizz\nThe " \
                 "number is 10 and the string is Buzz\nThe number is 11 and the string is 11\nThe number is 12 and " \
                 "the string is Fizz\nThe number is 13 and the string is 13\nThe number is 14 and the string is 14\n" \
                 "The number is 15 and the string is FizzBuzz\nThe number is 16 and the string is 16\nThe number is " \
                 "17 and the string is 17\nThe number is 18 and the string is Fizz\nThe number is 19 and the string " \
                 "is 19\nThe number is 20 and the string is Buzz\nThe number is 21 and the string is Fizz\nThe number" \
                 " is 22 and the string is 22\nThe number is 23 and the string is 23\nThe number is 24 and the string" \
                 " is Fizz\nThe number is 25 and the string is Buzz\nThe number is 26 and the string is 26\nThe " \
                 "number is 27 and the string is Fizz\nThe number is 28 and the string is 28\nThe number is 29 and " \
                 "the string is 29\nThe number is 30 and the string is FizzBuzz\nThe number is 31 and the string is " \
                 "31\nThe number is 32 and the string is 32\nThe number is 33 and the string is Fizz\nThe number is " \
                 "34 and the string is 34\nThe number is 35 and the string is Buzz\nThe number is 36 and the string " \
                 "is Fizz\nThe number is 37 and the string is 37\nThe number is 38 and the string is 38\nThe number " \
                 "is 39 and the string is Fizz\nThe number is 40 and the string is Buzz\nThe number is 41 and the " \
                 "string is 41\nThe number is 42 and the string is Fizz\nThe number is 43 and the string is 43\nThe " \
                 "number is 44 and the string is 44\nThe number is 45 and the string is FizzBuzz\nThe number is 46 " \
                 "and the string is 46\nThe number is 47 and the string is 47\nThe number is 48 and the string is " \
                 "Fizz\nThe number is 49 and the string is 49\nThe number is 50 and the string is Buzz\n",
                 strIO_cap.string
  end

end