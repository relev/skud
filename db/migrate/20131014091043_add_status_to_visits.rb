class AddStatusToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :lock, :integer
  end
end
