require 'test_helper'
require 'utils/csv/aircraft_report_tools'
class AircraftReportToolsTest < ActiveSupport::TestCase
  include Utils::Csv::AircraftReportTools
  def setup
    @batch = tds_batches(:first)
  end

  test 'sanity' do
    raw_line = '2022-09-01T05:51:12Z,2022-09-01T04:30:00Z,,,,,,,B737,56.4988,-134.9229,34000,,,,,,,CHOP,LGT,,,,,,,,,,,,,,,,,,,,,,,PIREP,SIT UA /OV BKA116030/TM 0430/FL340/TP B737/TB LGT CHOP/RM ZAN,'
    parsed_row = CSV.parse(raw_line).first
    assert_not_nil(parsed_row)
    assert_equal(parsed_row.count, 45)

    normalized_row = transform_row_columns(parsed_row)
    assert_not_nil(normalized_row)
    assert_kind_of(Hash, normalized_row)
    assert_nothing_raised do
      normalized_row.to_json
    end
  end
end
