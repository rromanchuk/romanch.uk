json.type 'FeatureCollection'
json.features pireps do |pirep|
  json.type 'Feature'
  json.geometry do
    json.type 'Point'
    json.coordinates [pirep.longitude, pirep.latitude]
  end
  json.properties do
    json.id pirep.id
    json.title pirep.raw_text
    # json.description pirep.description
    # json.icon pirep.icon
    # json.iconSize [pirep.icon_size, pirep.icon_size]
    # json.iconAnchor [pirep.icon_anchor, pirep.icon_anchor]
    # json.popupAnchor [pirep.popup_anchor, pirep.popup_anchor]
    # json.html pirep.html
  end
end
