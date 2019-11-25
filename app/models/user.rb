class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, presence: true


  def mood
    self.nausea > self.happiness ? 'sad' : 'happy'
  end

end
