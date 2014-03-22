class AddDistanceToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :distance, :integer
  end
end
