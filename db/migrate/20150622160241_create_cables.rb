class CreateCables < ActiveRecord::Migration
  def change
    create_table :cables do |t|
      t.references :cable_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :cables, :cable_types
  end
end
