json.array!(@cable_types) do |cable_type|
  json.extract! cable_type, :id, :length, :color
  json.url cable_type_url(cable_type, format: :json)
end
