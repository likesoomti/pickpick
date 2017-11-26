class CreateReservationAccepts < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_accepts do |t|

      t.timestamps
    end
  end
end
