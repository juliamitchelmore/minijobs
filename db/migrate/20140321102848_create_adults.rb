class CreateAdults < ActiveRecord::Migration
  def change
    create_table :adults do |t|
      t.string :name
      t.string :email
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
