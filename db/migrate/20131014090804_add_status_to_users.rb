class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lock, :integer
  end
end
