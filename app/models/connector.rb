class Connector < ActiveRecord::Base

  # Associations
  belongs_to  :device
  belongs_to  :cable
  has_one     :cable_type, through: :cable


  # Validations
  validates :end, inclusion: { in: [1,2] }, presence: true, uniqueness: { scope: :cable_id }
  validates_associated :cable


  # Delegation
  delegate :name, to: :device, prefix: true, allow_nil: true
  delegate :name, to: :connector_type, prefix: true


  #
  # connector_type
  # 
  # Fetches the connector type for this connector,  using the "end" property of the connector to 
  # interrogate the cable's "connector_types" array, where we will always return 1 and 2 in the same
  # order.
  #
  def connector_type
    cable.connector_types[self.end - 1]
  end

end
