class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :device_type, index: true
      t.string :name
      t.references :user, index: true
      t.integer :session_key
      t.string :device_key

      t.timestamps
    end
  end
end
