# RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |store|
#   store.default = RGeo::Cartesian.preferred_factory

#   store.register(RGeo::Geographic.spherical_factory(srid: 4326, has_z_coordinate: true),
#                  { geo_type: 'point', srid: 4326, sql_type: 'geography' })
# end
