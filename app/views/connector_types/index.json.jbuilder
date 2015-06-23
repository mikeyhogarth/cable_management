json.array!(@connector_types) do |connector_type|
  json.extract! connector_type, :id, :name
  json.url connector_type_url(connector_type, format: :json)
end
