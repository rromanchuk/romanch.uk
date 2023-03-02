# rubocop:disable all
require 'csv'
module Tds
  module Pireps
    module Tools
      extend self

      def report_type(row)
        row[42]
      end

      def parsed_remarks(raw_text)
        Tds::Pirep::REMARKS.match(raw_text)&.[](:remarks)
      end
      
      def transform_pirep(row)
        {
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
          aircraft_type_designator_id: Tds::AircraftTypeDesignator.find_or_create_by!(icao_code: row[8].force_encoding('UTF-8'))&.id,
          station_id: Tds::Station.find_or_create_by!(code: row[43].squish.match(/\w{3}/)[0])&.id,
          remarks: parsed_remarks(row[43].squish),
          latitude: row[9]&.to_f,
          longitude: row[10]&.to_f,
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
          raw_text: row[43].squish # Key
        }.compact
      end

      def transform_airep(row)
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
          latitude: row[9]&.to_f,
          longitude: row[10]&.to_f,
          altitude_ft_msl: row[11]&.to_i,
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
          temp_c: row[38]&.to_f,
          wind_dir_degrees: row[39]&.to_i,
          wind_speed_kt: row[40]&.to_i,
          vert_gust_kt: row[41&.to_i],
          raw_text: row[43].squish # Key
        }.compact
      end # by_csv_row
    end
  end
end