class AddDistanceToKid < ActiveRecord::Migration
  def change
    add_column :kids, :distance, :integer
  end
end
