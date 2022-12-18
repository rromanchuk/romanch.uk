# rubocop:disable all

require 'csv'
module Utils
  module Csv
    module TafReportTools
      extend self

      def factory = RGeo::Geographic.spherical_factory(srid: 4326, has_z_coordinate: true)

      def transform_row_columns(row)
        transformed_row = {
          raw_text: row[0].squish,
          station_id: row[1],
          issue_time: Time.parse(row[2]),
          bulletin_time: Time.parse(row[3]),
          bulletin_time: Time.parse(row[4]),
          valid_time_from: Time.parse(row[5]),
          valid_time_to: Time.parse(row[6]),
          remarks: row[7],
          location: factory.point(row[9]&.to_f,
                                  row[8]&.to_f, row[10]&.to_i).to_s,
          
          forecasts: [
            {
            fcst_time_from: Time.parse(row[11]),
            fcst_time_to: Time.parse(row[12]),
            change_indicator: row[13],
            time_becoming: row[14],
            probability: row[15],
            wind_dir_degrees: row[16]&.to_i,
            wind_speed_kt: row[17]&.to_i,
            wind_gust_kt: row[18]&.to_i,
            wind_shear_hgt_ft_agl: row[19]&.to_i,
            wind_shear_dir_degrees: row[20]&.to_i,
            wind_shear_speed_kt: row[21]&.to_i,
            visibility_statute_mi: row[22],
            altim_in_hg: row[23],
            vert_vis_ft: row[24]&.to_i,
            wx_string: row[25],
            not_decoded: row[26],
            sky_condition: [
              {
                sky_cover: row[27],
                cloud_base_ft_agl: row[28]&.to_i,
                cloud_type: row[29],
              },
              {
                sky_cover: row[30], #ad
                cloud_base_ft_agl: row[31]&.to_i,],
                cloud_type: row[32],
              },
              {
                sky_cover: row[33], #ag
                cloud_base_ft_agl: row[34]&.to_i,
                cloud_type: row[35],
              }
            ],
            turbulence_condition: [
              {
                turbulence_intensity: row[36],	
                turbulence_min_alt_ft_agl: row[37]&.to_i,	
                turbulence_max_alt_ft_agl: row[38]&.to_i,
              }
            ],
            icing_condition: [
              {
                icing_intensity: row[39], #AM
                icing_min_alt_ft_agl: row[40]&.to_i,
                icing_max_alt_ft_agl:	row[41]&.to_i, 
                valid_time: Time.parse(row[42]),
                sfc_temp_c: row[43],
                max_or_min_temp_c: row[44],
              }
            ],
           

            
            
            
            
            
            valid_time:
            sfc_temp_c:	
            max_or_min_temp_c:
            valid_time:	,
            sfc_temp_c: ,	
            max_or_min_temp_c: ,
          }]
        }.compact

        t[:response][7][:data].count
      end # by_csv_row
    end
  end
end
