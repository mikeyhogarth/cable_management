class CableType < ActiveRecord::Base


  # Associations
  has_many :cables
  belongs_to :connector_type_1, class: ConnectorType, foreign_key: :connector_type_1_id
  belongs_to :connector_type_2, class: ConnectorType, foreign_key: :connector_type_2_id


  # Validations
  validates :length, numericality: true
  validates_associated :connector_type_1
  validates_associated :connector_type_2


  #
  # connector_types
  #
  # This needs to be an array because the two connector types could be 
  # the same model (e.g. two RJ45's). Also, this ensures that it will 
  # always return exactly two items. 
  #
  def connector_types
    [connector_type_1, connector_type_2]
  end


  # 
  # description
  #
  # Would be in a presenter in the actual product. Creates a description
  # of the cable type like this: 
  #
  # "RJ45 <-> RJ40"
  #
  def description
    "#{connector_type_1.name} <-> #{connector_type_2.name}"
  end
end
