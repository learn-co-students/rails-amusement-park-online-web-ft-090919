class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  validates :name, presence: true
  validates :min_height, presence: true
  validates :tickets, presence: true
  validates :nausea_rating, :inclusion => 1..5
  validates :happiness_rating, :inclusion => 1..5

  def amount_of_rides
    self.users.all.count
  end
end
