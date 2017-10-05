class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.integer :people
      t.string :place
      t.string :time

      t.timestamps
    end
  end
end
