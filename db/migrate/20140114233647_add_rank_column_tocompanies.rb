class AddRankColumnTocompanies < ActiveRecord::Migration
  def change
  	add_column :companies , :rank, :integer
  end
end
