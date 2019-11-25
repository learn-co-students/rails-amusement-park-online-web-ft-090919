class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def self.check(user, attraction)
    errors = []
    errors << "You do not have enough tickets to go on this ride" if user.tickets < attraction.tickets
    errors << "You are not tall enough" if user.height < attraction.min_height
    errors
  end

  def self.create_ride(user, attraction)
    user_tickets = user.tickets
    attraction_tickets = attraction.tickets
    total = user_tickets - attraction_tickets
    user.tickets = total
    user.save
    ride = self.create(attraction_id: attraction.id, user_id: user.id)
    ride
  end
end
