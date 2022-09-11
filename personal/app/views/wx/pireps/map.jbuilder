json.type 'Feature'
json.geometry do
  json.type 'Point'
  json.coordinates [raw_report.location.longitude, raw_report.location.latitude]
end
