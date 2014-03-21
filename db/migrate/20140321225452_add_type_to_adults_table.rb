class AddTypeToAdultsTable < ActiveRecord::Migration
  def change
   add_column :adults, :type, :string
  end
end
