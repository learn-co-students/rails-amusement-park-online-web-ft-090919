class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if !!self.happiness || !!self.nausea
            if self.happiness > self.nausea
                "happy"
            else
                "sad"
            end
        end
    end

    def is_admin?
        if self.admin
            "ADMIN"
        end
    end

end
