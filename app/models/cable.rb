class Cable < ActiveRecord::Base

  # Associations
  belongs_to :cable_type
  has_many :connectors, dependent: :destroy
  has_many :devices, through: :connectors
  accepts_nested_attributes_for :connectors


  # Delegation
  delegate :connector_types, to: :cable_type


  # Callbacks
  after_save :ensure_exactly_two_connectors


  #
  # ensure_two_connectors
  #
  # Run as a callback - ensures that the number of connectors for the
  # cable is exactly two.
  #
  def ensure_exactly_two_connectors
    if connectors.count != 2
      errors.add(:base, "Must have exactly two connectors")
      raise ActiveRecord::Rollback
    end
  end

 
  #
  # description
  #
  # This would be in a presenter in the actual product. Creates
  # a description like this for the cable:
  #
  # "Device 3 (RJ45) <-> Device 2 (RJ40)"
  #
  def description
    connectors.map do |connector|
      "#{connector.device_name} (#{connector.connector_type_name})"
    end.join(" <-> ")
  end

end
