class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
    
    validates :user_id, presence: true
    validates :attraction_id, presence: true
    
    def take_ride
      if !has_enough_tickets && !tall_enough
        "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      elsif !has_enough_tickets 
        "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      elsif !tall_enough
        "Sorry. You are not tall enough to ride the #{attraction.name}."
      else
        update_user
        "Thanks for riding the #{attraction.name}!"
      end
        
    end

    private

    def has_enough_tickets
      user.tickets >= attraction.tickets
    end

    def tall_enough
      user.height >= attraction.min_height
    end

    def update_user
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    end
end
