class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :device_type, index: true
      t.references :user, index: true
      t.integer :session_key
      t.string :name
      t.string :device_key

      t.timestamps
    end
  end
end
