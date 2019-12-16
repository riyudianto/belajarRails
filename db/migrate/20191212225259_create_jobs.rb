class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title_job
      t.string :desc_job
      t.string :status

      t.timestamps
    end
  end
end
