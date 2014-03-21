class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.string :duration
      t.string :cost
      t.string :image

      t.timestamps
    end
  end
end
