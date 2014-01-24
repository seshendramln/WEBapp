class CreateUserViews < ActiveRecord::Migration
  def change
    create_table :user_views do |t|
      t.integer :user_id,  :unique => true
      
      

      t.timestamps
    end
  end
end
