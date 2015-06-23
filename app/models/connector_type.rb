class ConnectorType < ActiveRecord::Base

  # Validations
  validates :name, presence: true


  # Pseudo-associations

  #
  # cable_types
  #
  def cable_types
    CableType.where(connector_type_1_id: id) | CableType.where(connector_type_2: id)
  end


  #
  # cables
  #
  def cables
    Cable.where(cable_type_id: cable_types)
  end


  #
  # connectors
  #
  def connectors
    Connector.where(cable_id: cables)
  end

end
