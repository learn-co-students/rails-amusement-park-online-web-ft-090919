class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  validates :name, presence: true
  validates :height, presence: true
  validates :tickets, presence: true
  validates :nausea, :inclusion => 1..5
  validates :happiness, :inclusion => 1..5

  def mood
    case self.happiness
    when 1..2
      "Sad"
    when 3
      "Okay"
    when 4..5
      "Happy"
    end
  end
end
