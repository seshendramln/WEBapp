class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
           t.integer  :trust
           t.integer  :workplace
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
           t.integer  :onjectives
           t.integer  :cooperation
           t.integer  :guidance
           t.integer  :reward
           t.integer  :career
           t.integer  :transparancy
           t.integer  :company_id
           t.integer  :user_id
      t.timestamps
    end
  end
end
