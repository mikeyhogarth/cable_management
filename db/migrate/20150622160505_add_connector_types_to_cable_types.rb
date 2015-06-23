class AddConnectorTypesToCableTypes < ActiveRecord::Migration
  def change
    add_column :cable_types, :connector_type_1_id, :integer
    add_column :cable_types, :connector_type_2_id, :integer
  end
end
