require 'minitest/autorun'
load 'person.rb'

class TestPerson < MiniTest::Test

  def setup
    @person = Person.new("Carol", 22)
  end

  def test_old_return_false
    assert @person.old? == false
  end

  def test_meeting_return_string
   assert @person.meeting == "Hi, nice to meet you! My name is #{@person.name}"
  end

end