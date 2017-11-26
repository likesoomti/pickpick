class CreateReservationAccepts < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_accepts do |t|
      t.references :reservation, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :store
      t.boolean :rev_ok
      t.timestamps
    end
  end
end
