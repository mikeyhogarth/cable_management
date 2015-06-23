json.array!(@cables) do |cable|
  json.extract! cable, :id, :cable_type_id
  json.url cable_url(cable, format: :json)
end
