class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :people
      t.string :time
      t.string :place
      t.string :durationTime
      t.timestamps
    end
  end
end