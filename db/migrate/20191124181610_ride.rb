class Ride < ActiveRecord::Migration[5.2]
  def change
    create_join_table :rides, :id => false do |t|
      t.integer :attraction_id
      t.integer :user_id
    end
  end
end
