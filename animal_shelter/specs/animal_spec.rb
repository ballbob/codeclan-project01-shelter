require('minitest/autorun')
require('minitest/rg')
require_relative('../models/animal.rb')

class TestAnimal < Minitest::Test 

  def setup()
    @animal1 = Animal.new({"name" => "Billy", "adoptable" => "with experience", "admission_date" => "06/06/2006", "type" => "tortoise"})
  end

  def test_name
    @animal1.name
  end

end