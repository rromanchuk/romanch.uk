# rubocop:disable all

require 'csv'
module Utils
  module Csv
    module AircraftReportTools
      extend self

      def factory = RGeo::Geographic.spherical_factory(srid: 4326, has_z_coordinate: true)

      def transform_row_columns(row)
        transformed_row = {
          receipt_time: Time.parse(row[0]),
          observation_time: Time.parse(row[1]), # sort key
          data: {
            mid_point_assumed: row[2],
            no_time_stamp: row[3],
            flt_lvl_range: row[4],
            above_ground_level_indicated: row[5],
            no_flt_lvl: row[6],
            bad_location: row[7]
          }.compact,
          aircraft_ref: row[8],
          location: factory.point(row[10]&.to_f,
                                  row[9]&.to_f, row[11]&.to_i).to_s,
          altitude_ft_msl: row[11]&.to_i,
          sky_condition: [
            {
              sky_cover: row[12],
              cloud_base_ft_msl: row[13]&.to_i,
              cloud_top_ft_msl: row[14]&.to_i
            }.compact,
            {
              sky_cover: row[15],
              cloud_base_ft_msl: row[16]&.to_i,
              cloud_top_ft_msl: row[17]&.to_i
            }.compact
          ].compact_blank.presence,
          turbulence_condition: [
            {
              turbulence_type: row[18],
              turbulence_intensity: row[19],
              turbulence_base_ft_msl: row[20]&.to_i,
              turbulence_top_ft_msl: row[21]&.to_i,
              turbulence_freq: row[22]
            }.compact,
            {
              turbulence_type: row[23],
              turbulence_intensity: row[24],
              turbulence_base_ft_msl: row[25]&.to_i,
              turbulence_top_ft_msl: row[26]&.to_i,
              turbulence_freq: row[27]
            }.compact
          ].compact_blank.presence,
          icing_condition: [
            {
              icing_type: row[28],
              icing_intensity: row[29],
              icing_base_ft_msl: row[30]&.to_i,
              icing_top_ft_msl: row[31]&.to_i
            }.compact,
            {
              icing_type: row[32],
              icing_intensity: row[33],
              icing_base_ft_msl: row[34]&.to_i,
              icing_top_ft_msl: row[35]&.to_i
            }.compact
          ].compact_blank.presence,
          visibility_statute_mi: row[36],
          wx_string: row[37],
          temp_c: row[38]&.to_f,
          wind_dir_degrees: row[39]&.to_i,
          wind_speed_kt: row[40]&.to_i,
          vert_gust_kt: row[41&.to_i],
          report_type: row[42],
          raw_text: row[43].squish # Key
        }.compact
      end # by_csv_row
    end
  end
end
