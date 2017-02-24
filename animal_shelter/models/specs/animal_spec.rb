require('minitest/autorun')
require('minitest/rg')
require_relative('../animal.rb')

class TestAnimal < Minitest::Test 

  def setup()
    @animal1 = Animal.new({"name" => "Billy", "adoptable" => "with experience", "admission_date" => "06/06/2006", "type" => "tortoise"})
  end

  def test_name
    assert_equal("Billy",@animal1.name)
  end

  def test_adoptable
    assert_equal(@animal1.adoptable, "with experience")
  end

  def test_admission_date
    assert_equal(@animal1.admission_date, "06/06/2006")
  end

  def test_type
    assert_equal(@animal1.type, "tortoise")
  end

end