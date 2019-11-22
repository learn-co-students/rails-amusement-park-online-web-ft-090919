class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride

    enough_tickets = meet_requirements[0]
    tall_enough = meet_requirements[1]

    if enough_tickets && tall_enough
      begin_ride 
    elsif tall_enough && !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end
  end

  def begin_ride
   
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    
    new_tickets =  self.user.tickets - self.attraction.tickets
   
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets
    )
  end

  
  def meet_requirements
    enough_tickets = (self.user.tickets >= self.attraction.tickets)
    tall_enough = (self.user.height >= self.attraction.min_height)
    [enough_tickets, tall_enough]
  end

end