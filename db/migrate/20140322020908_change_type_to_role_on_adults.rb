class ChangeTypeToRoleOnAdults < ActiveRecord::Migration
  def change
    rename_column :adults, :type, :role
  end
end
