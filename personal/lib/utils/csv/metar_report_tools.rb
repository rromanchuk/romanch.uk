require 'csv'
module Utils
  module Csv
    module MetarReportTools
      extend self

      def factory = RGeo::Geographic.spherical_factory(srid: 4326, has_z_coordinate: true)

      def transform_row_columns(row)
        transformed_row = {
          raw_text: row[0].squish,
          station_id: row[1],
          observation_time: Time.parse(row[2]), # sort key
          location: factory.point(row[4]&.to_f,
                                  row[3]&.to_f, row[43]&.to_i).to_s,
          temp_c: row[5]&.to_f,
          dewpoint_c: row[6]&.to_f,
          wind_dir_degrees: row[7]&.to_i,
          wind_speed_kt: row[8]&.to_i,
          wind_gust_kt: row[9]&.to_i,
          visibility_statute_mi: row[10],
          altim_in_hg: row[11],
          sea_level_pressure_mb: row[12]&.to_f,
          data: {
            corrected: row[13],
            auto: row[14],
            auto_station: row[15],
            maintenance_indicator: row[16],
            no_signal: row[17],
            lightning_sensor_off: row[18],
            freezing_rain_sensor_off: row[19],
            present_weather_sensor_off: row[20]
          }.compact,
          wx_string: row[21],
          sky_condition: [
            {
              sky_cover: row[22],
              cloud_base_ft_agl: row[23]&.to_i
            }.compact,
            {
              sky_cover: row[24],
              cloud_base_ft_agl: row[25]&.to_i
            }.compact,
            {
              sky_cover: row[26],
              cloud_base_ft_agl: row[27]&.to_i
            }.compact,
            {
              sky_cover: row[28],
              cloud_base_ft_agl: row[29]&.to_i
            }.compact
          ].compact_blank,

          flight_category: row[30],
          three_hr_pressure_tendency_mb: row[31]&.to_f,
          maxT_c: row[32]&.to_f,
          minT_c: row[33]&.to_f,
          maxT24hr_c: row[34]&.to_f,
          minT24hr_c: row[35]&.to_f,
          precip_in: row[36]&.to_f,
          pcp3hr_in: row[37]&.to_f,
          pcp6hr_in: row[38]&.to_f,
          pcp24hr_in: row[39]&.to_f,
          snow_in: row[40]&.to_f,
          vert_vis_ft: row[41]&.to_i,
          metar_type: row[42]
        }.compact
      end # by_csv_row
    end
  end
end
