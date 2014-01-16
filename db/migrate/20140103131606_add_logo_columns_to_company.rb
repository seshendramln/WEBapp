class AddLogoColumnsToCompany < ActiveRecord::Migration
  def change
  	add_attachment :companies, :logo
  end
end
