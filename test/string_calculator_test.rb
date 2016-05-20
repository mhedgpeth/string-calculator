require 'minitest/autorun'
require 'purdytest'
require_relative '../lib/string_calculator'

module MiniTest::Assertions
  def assert_add(expected, text)
    actual = StringCalculator.add(text)
    assert actual == expected, "Expecting #{expected} to add to #{expected} but instead it adds to #{actual}"
  end
end

String.infect_an_assertion :assert_add, :should_add_to

describe StringCalculator do
  it 'should return 0 for empty string' do
    ''.should_add_to 0
  end
  
  it 'should return 1 given 1' do
    '1'.should_add_to 1
  end

  it 'should return 2 given 2' do
    '2'.should_add_to 2
  end
  
  it 'should return 3 given 1,2' do
    '1,2'.should_add_to 3
  end
  
  it 'should return 12 given 10,2' do
    '10,2'.should_add_to 12
  end
  
  it 'should handle an unknown amount of numbers' do
    '11,12,13'.should_add_to 36
  end
  
  it 'should allow newline as delimiter' do
    '1\n2'.should_add_to 3
  end
  
  it 'should allow a different delimiter' do
    '//;\n1;2'.should_add_to 3
  end
end