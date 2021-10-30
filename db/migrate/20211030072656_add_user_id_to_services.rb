class AddUserIdToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :user_id, :integer
    add_index :services, :user_id
  end
end
