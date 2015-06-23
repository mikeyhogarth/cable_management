class CreateConnectors < ActiveRecord::Migration
  def change
    create_table :connectors do |t|
      t.integer :cable_id
      t.integer :end
      t.integer :device_id

      t.timestamps null: false
    end
  end
end
