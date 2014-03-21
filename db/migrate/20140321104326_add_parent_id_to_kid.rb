class AddParentIdToKid < ActiveRecord::Migration
  def change
    add_column :kids, :parent_id, :integer
  end
end
