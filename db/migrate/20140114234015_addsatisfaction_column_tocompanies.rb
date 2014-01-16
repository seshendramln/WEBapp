class AddsatisfactionColumnTocompanies < ActiveRecord::Migration
  def change
  	add_column :companies , :satisfaction, :integer
  end
end
