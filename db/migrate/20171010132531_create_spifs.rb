class CreateSpifs < ActiveRecord::Migration[5.1]
  def change
    create_table :spifs do |t|
      t.string :name
      t.text :address
      t.integer :pph
      t.binary :photo
      t.string :place
      t.string :park
      t.string :smok
      t.string :wifi
      t.string :printer
      t.string :consent
      t.string :projector
      t.string :payment
      t.time :ot
      t.time :ct

      t.timestamps
    end
  end
end
