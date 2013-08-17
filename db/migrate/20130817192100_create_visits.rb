class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :user, index: true
      t.references :device, index: true
      t.integer :session_key
      t.timestamp :closed_at

      t.timestamps
    end
  end
end
