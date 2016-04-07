json.array!(@houses) do |house|
  json.extract! house, :id, :nombre, :descripcion
  json.url house_url(house, format: :json)
end
