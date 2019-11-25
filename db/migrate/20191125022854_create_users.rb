class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :nausea
      t.integer :happiness
      t.integer :tickets, default: 0
      t.integer :height
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
