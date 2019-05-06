class Hotel
  attr_accessor :guests

  def initialize
    @guests = []
    @occupied_room = []
  end

  def check_in_guest(guest_name, room_number)
    if @occupied_room.include?(room_number)
      false
    else
      @guests << guest_name
      @occupied_room << room_number
      true
    end
  end

  def check_out_guest(guest_name, room)
    @guests.delete(guest_name)
    @occupied_room.delete(room)
  end
end

describe Hotel do
  describe 'check in a guest' do
    context 'when room is available' do
      it 'checks in a guest' do
        hotel = Hotel.new
        expect(hotel.check_in_guest('Ruby', 302)).to be true
      end
    end

    context 'when room is available' do
      it 'cannot check in a guest' do
        hotel = Hotel.new
        hotel.check_in_guest('David', 303)
        expect(hotel.check_in_guest('Eric', 303)).to be false
      end
    end

  end

  describe 'checkout a guest' do
    it 'checks out a guest' do
      hotel = Hotel.new
      hotel.check_in_guest('Ruby', 203)
      hotel.check_out_guest('Ruby', 203)
      expect(hotel.guests).not_to include 'Ruby'
    end

    it 'frees up the room' do
      hotel = Hotel.new
      hotel.check_in_guest('Ruby', 203)
      hotel.check_out_guest('Ruby', 203)
      expect(hotel.check_in_guest('Eric', 303)).to be true
    end
  end
end