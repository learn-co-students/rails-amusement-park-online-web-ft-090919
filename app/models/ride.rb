class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    has_tickets = user.tickets > attraction.tickets 
    has_height = user.height > attraction.min_height 
    unless has_tickets && has_height 
      msg = "Sorry." 
      msg += " You do not have enough tickets to ride the #{attraction.name}." unless has_tickets
      msg += " You are not tall enough to ride the #{attraction.name}." unless has_height
      msg
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
