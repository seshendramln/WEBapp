class AddattribsatisfactionColumnTocompanies < ActiveRecord::Migration
  def change
  	add_column :companies, :attrib_satisfaction, :integer
  end
end
