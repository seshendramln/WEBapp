class AddRatingToUser < ActiveRecord::Migration
  def change
    add_column :users, :rating_id, :integer
  end
end
