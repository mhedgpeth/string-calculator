require 'minitest'
require 'minitest/autorun'
require 'purdytest'
require_relative '../lib/string_calculator'


module MiniTest::Assertions
  def assert_add(expected, text)
    actual = text.extend(StringCalculator).add
    assert actual  == expected, "Expected #{text} to add to #{expected} but instead it added to #{actual}"
  end
end

String.infect_an_assertion :assert_add, :should_add_to

describe StringCalculator do
  it 'should return 0 from a blank string' do
    ''.should_add_to 0
  end
  
  it 'should return 1 from 1' do
    '1'.should_add_to 1
  end
  
  it 'should return 2 from 2' do
    '2'.should_add_to 2
  end
  
  it 'should return 3 from 1,2' do
    '1,2'.should_add_to 3
  end
  
  it 'should return 13 from 10,3' do
    '10,3'.should_add_to 13
  end
  
  it 'should return 35 for 15,20' do
    '15,20'.should_add_to 35
  end
  
  it 'should return 40 for 10,20,10' do
    '10,20,10'.should_add_to 40
  end
  
  it 'should return 3 for 1\n2' do
    '1\n2'.should_add_to 3
  end
  
  it 'should allow delimiter to be defined with //;\n4;5 should return 9' do
    '//;\n4;5'.should_add_to 9
  end
  
  it 'negatives not allowed should raise exception' do
    proc {'-1,2'.extend(StringCalculator).add }.must_raise ArgumentError
  end
  
  it 'negatives not allowed should raise exception with negatives in the message' do
    error = proc {'-1,-2,-3'.extend(StringCalculator).add }.must_raise ArgumentError
    error.message.must_equal 'negatives not allowed: -1, -2, -3'
  end
end