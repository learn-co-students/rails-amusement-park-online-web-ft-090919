class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.string :tickets
      t.string :nausea_rating
      t.string :happiness_rating
      t.string :min_height
      t.integer :user_id
      t.integer :attraction_id
    end
  end
end
