class AdultsJobs < ActiveRecord::Migration
  def change
    create_table :adults_jobs, :id => false do |t|
      t.integer :adult_id
      t.integer :job_id
    end
  end
end
