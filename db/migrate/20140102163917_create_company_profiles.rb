class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
    	t.belongs_to :profile
    	t.belongs_to :company
    	t.string :to_date
    	t.string :from_date	
     	t.timestamps
    end
  end
end
