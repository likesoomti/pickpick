class CreateSpaceInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :space_infos do |t|
      t.string :name
      t.text :address
      t.integer :price_per_hour
      t.time :ot
      t.time :ct
      t.integer :tel
      t.binary :photo
      t.string :parking
      t.string :smoking
      t.string :projector
      t.string :wifi
      t.string :printer
      t.string :consent
      t.string :payment
      t.string :place

      t.timestamps
    end
  end
end
