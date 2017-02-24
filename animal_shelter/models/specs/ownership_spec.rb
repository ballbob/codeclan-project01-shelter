require('minitest/autorun')
require('minitest/rg')
require_relative('../ownership.rb')

class TestOwnership < Minitest::Test

  def setup()
    @ownership1 = ({"owner_id" => "1", "animal_id" => "2"})
  end

  def test_owner_id
    assert_equal(@ownership1.owner_id, "1")
  end

end