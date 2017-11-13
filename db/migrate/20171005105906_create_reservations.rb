class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :people
      t.string :place
      t.string :time

      t.timestamps
    end
  end
end
