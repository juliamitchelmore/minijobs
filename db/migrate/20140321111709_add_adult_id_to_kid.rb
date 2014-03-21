class AddAdultIdToKid < ActiveRecord::Migration
  def change
    add_column :kids, :adult_id, :integer
  end
end
