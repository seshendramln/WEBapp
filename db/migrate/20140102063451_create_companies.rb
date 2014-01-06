class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :place
      t.text :Description
      t.timestamps
    end
  end
end
