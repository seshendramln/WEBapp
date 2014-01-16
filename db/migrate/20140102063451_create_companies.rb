class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :place
      t.text :Description
       t.integer :attrib_work_environment
       t.integer  :attrib_cd
	   t.integer  :attrib_flexibility
	   t.integer  :attrib_relation
	   t.integer  :attrib_leadership
	   t.integer  :attrib_pride
	   t.integer  :attrib_opportunities
	   t.integer  :attrib_opinion
	   t.integer  :attrib_stimulatingjob
	   t.integer  :attrib_innovation
	   t.integer  :attrib_management
	   t.integer  :attrib_compensation
	   t.integer  :attrib_workload
	   t.integer  :attrib_equality
	   t.integer  :attrib_objectives
	   t.integer  :attrib_cooperation
	   t.integer  :attrib_guidance
	   t.integer  :attrib_reward
	   t.integer  :attrib_career
	   t.integer  :attrib_transparancy
	   t.integer  :totalreviews
      t.timestamps
    end
  end
end
