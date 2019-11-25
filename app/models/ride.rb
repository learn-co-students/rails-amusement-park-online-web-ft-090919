class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride

    msg = update_tickets

    if user.height < attraction.min_height
      msg ? msg += " You are not tall enough to ride the #{attraction.name}." : msg = "Sorry. You are not tall enough to ride the #{attraction.name}."
    end

    update_feelings

    return msg if msg
  end

  private

  def update_tickets
    if user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.save
      nil
    end
  end

  def update_feelings
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end
end
