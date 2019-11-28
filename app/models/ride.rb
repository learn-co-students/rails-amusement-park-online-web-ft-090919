class Ride < ActiveRecord::Base
    belongs_to :user
  belongs_to :attraction

  def take_ride
    user_has_enough_tickets, user_is_tall_enough = user_meets_requirements
    if user_has_enough_tickets && user_is_tall_enough
      start_ride
    elsif user_is_tall_enough && !user_has_enough_tickets
      'Sorry. ' + not_enough_tickets
    elsif !user_is_tall_enough && user_has_enough_tickets
      'Sorry. ' + not_tall_enough
    elsif !user_is_tall_enough && !user_has_enough_tickets
      'Sorry. ' + not_enough_tickets + ' ' + not_tall_enough
    end
  end

  def user_meets_requirements
    user_has_enough_tickets, user_is_tall_enough = false
    if user.tickets >= attraction.tickets
      user_has_enough_tickets = true
    end
    if user.height >= attraction.min_height
      user_is_tall_enough = true
    end
    [user_has_enough_tickets, user_is_tall_enough]

  end

  def start_ride
    new_happiness = user.happiness + attraction.happiness_rating
    new_nausea = user.nausea + attraction.nausea_rating
    new_ticket_count = user.tickets - attraction.tickets
    user.update(
      happiness: new_happiness,
      nausea: new_nausea,
      tickets: new_ticket_count
    )
    "Thanks for riding the #{attraction.name}!"
  end

  def not_enough_tickets
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride the #{attraction.name}."
  end
end
