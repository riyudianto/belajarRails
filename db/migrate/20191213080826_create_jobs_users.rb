class CreateJobsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs_users do |t|
      t.string :status
      t.integer :job_id
      t.integer :user_id
      t.string :cover_letter
      t.string :attachment

      t.timestamps
    end
  end
end
