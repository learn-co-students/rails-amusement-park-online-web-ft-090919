class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def check_validity
    errors = []

    unless has_enough_tickets
      errors << "You do not have enough tickets to ride the #{attraction.name}."
    end
    unless is_tall_enough
      errors << "You are not tall enough to ride the #{attraction.name}."
    end

    if errors.empty?
      update_user
      "Thanks for riding the #{self.attraction.name}!"
    else
      "Sorry. #{errors.join(' ')}"
    end
  end

  def has_enough_tickets
    user.tickets >= attraction.tickets
  end

  def is_tall_enough
    user.height >= attraction.min_height
  end

  def update_user
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end

  def take_ride
    check_validity
  end

end
