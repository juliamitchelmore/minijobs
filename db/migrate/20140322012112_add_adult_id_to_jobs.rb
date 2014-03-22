class AddAdultIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :adult_id, :integer
  end
end
