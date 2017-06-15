class AddUseridColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :user_id, :integer
  end
end
