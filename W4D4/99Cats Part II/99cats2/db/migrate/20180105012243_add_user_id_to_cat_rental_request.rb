class AddUserIdToCatRentalRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :cat_rental_requests, :user_id, :integer
    add_index :cat_rental_requests, :user_id, unique: true
  end
end
