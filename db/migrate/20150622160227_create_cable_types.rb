class CreateCableTypes < ActiveRecord::Migration
  def change
    create_table :cable_types do |t|
      t.integer :length
      t.text :color

      t.timestamps null: false
    end
  end
end
