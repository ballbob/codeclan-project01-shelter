require('minitest/autorun')
require('minitest/rg')
require_relative('../owner.rb')

class TestOwner < Minitest::Test

  def setup()
    @owner1 = Owner.new({"name" => "Brian", "experience" => "10 years. Dogs, cats, exotics - terrapin."})
  end

  def test_name
    assert_equal(@owner1.name,"Brian")
  end

  def test_experience
    assert_equal(@owner1.experience,"10 years. Dogs, cats, exotics - terrapin.")
  end

end