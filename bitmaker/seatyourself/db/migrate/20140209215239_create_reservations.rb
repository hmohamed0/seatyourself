class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :date
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
