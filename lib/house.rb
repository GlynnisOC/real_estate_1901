class House
  attr_reader :price, :address, :rooms, :category

  def initialize(price, address)
    @price = price
    @address = address
  end

  def rooms
    @rooms = []
  end

  def add_room(room_number)
    @rooms = rooms
    @rooms << room_number
  end

  def rooms_from_category(category)
    @rooms.find_all do |r|
      r.category == @rooms.category
    end
  end
end
