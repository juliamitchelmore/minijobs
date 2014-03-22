class AddAboutToKidsTable < ActiveRecord::Migration
  def change
    add_column :kids, :about, :text
  end
end
