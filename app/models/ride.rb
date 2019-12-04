class Ride < ActiveRecord::Base

    belongs_to :user
    belongs_to :attraction

   
    def take_ride 
        if ticket_and_height_check
            update_ticket_number
            update_user_nausea
            update_user_happiness
        else 
          if !(height_check) && ticket_check
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
          elsif !(ticket_check) && height_check
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
          else 
          "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
          end
        end 
    end

    def ticket_check
        self.user.tickets >= self.attraction.tickets
        #     true
        # else 
        #     "Sorry. You do not have enouch tickets to ride the #{self.attraction.name}."
        # end 
    end 

    def height_check 
        self.user.height >= self.attraction.min_height
        #     true
        # else 
        #     "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        # end 
    end 

    def ticket_and_height_check 
        ticket_check == true && height_check == true
    end  

    def update_ticket_number
        new_tickets = (self.user.tickets) - (self.attraction.tickets)
        self.user.tickets = new_tickets
        self.user.save 
    end 

    def update_user_nausea
        new_nausea = (self.attraction.nausea_rating) + (self.user.nausea)
        self.user.nausea = new_nausea
        self.user.save
    end 

    def update_user_happiness
        new_happiness = (self.attraction.happiness_rating) + (self.user.happiness)
        self.user.happiness = new_happiness
        self.user.save
    end 

end

