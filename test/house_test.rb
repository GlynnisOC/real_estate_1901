require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'
require './lib/room'

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_how_much_is_it
    house = House.new("$400000", "123 sugar lane")
    #@price.to_i #talk to Amy or Brian about why
    #this does not work

    assert_equal "$400000", house.price
  end

  def test_what_is_its_address
    house = House.new("$400000", "123 sugar lane")

    assert_equal "123 sugar lane", house.address
  end

  def test_rooms
    house = House.new("$400000", "123 sugar lane")

    assert_equal [], house.rooms
  end

  def test_make_one_room
    room_1 = Room.new(:bedroom, 10, 13)

    assert_instance_of Room, room_1
  end

  def test_make_another_room
    room_2 = Room.new(:bedroom, 11, 15)

    assert_instance_of Room, room_2
  end

  def test_add_some_rooms_to_house
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    house = House.new("$400000", "123 sugar lane")

    assert_equal house.add_room(room_1), house.add_room(room_1)
    assert_equal house.add_room(room_2), house.add_room(room_2)
  end

  def test_add_some_more_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    assert_equal house.add_room(room_1), house.add_room(room_1)
    assert_equal house.add_room(room_2), house.add_room(room_2)
    assert_equal house.add_room(room_3), house.add_room(room_3)
    assert_equal house.add_room(room_4), house.add_room(room_4)
  end

  def test_does_it_return_rooms_that_categories_match
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
  end 

end
