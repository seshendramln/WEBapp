class AddreviewsColumnTocompanies < ActiveRecord::Migration
  def change
  		add_column :companies , :reviews, :integer
  end
end
