class CreateReservationAccepts < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_accepts do |t|
      t.integer :reservation
      t.integer :user
      t.integer :store
      t.boolean :rev_ok
      t.timestamps
    end
  end
end
