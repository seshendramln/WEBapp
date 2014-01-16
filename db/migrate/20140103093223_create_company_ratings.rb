class CreateCompanyRatings < ActiveRecord::Migration
  def change
    create_table :company_ratings do |t|
      t.references :user, index: true
      t.references :company, index: true
      t.integer :satisfaction
      t.integer :work_environment
       t.integer  :cd
	   t.integer  :flexibility
	   t.integer  :relation
	   t.integer  :leadership
	   t.integer  :pride
	   t.integer  :opportunities
	   t.integer  :opinion
	   t.integer  :stimulatingjob
	   t.integer  :innovation
	   t.integer  :management
	   t.integer  :compensation
	   t.integer  :workload
	   t.integer  :equality
	   t.integer  :objectives
	   t.integer  :cooperation
	   t.integer  :guidance
	   t.integer  :reward
	   t.integer  :career
	   t.integer  :transparancy

      t.timestamps
    end
  end
end
