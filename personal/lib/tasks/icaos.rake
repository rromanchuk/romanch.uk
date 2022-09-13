namespace :icaos do
  desc 'Load ICAO type codes'
  task ingest: :environment do
    require 'csv'
    ROOT = File.expand_path('../../', __dir__)
    CSV_FILE = File.join(ROOT, 'ICAO_AircraftType.csv')

    CSV.foreach(CSV_FILE) do |row|
      ap row
      next unless row[0]

      params = {}
      params[:icao_code] = row[0]
      params[:aircraft_class] = row[1]
      engines, weight_class = row[2]&.split('/')
      number_of_engines, engine_type = engines&.split('')
      params[:engine_type] = engine_type
      params[:number_of_engines] = number_of_engines
      params[:weight_class] = weight_class
      params[:icao_wtc] = row[3]
      params[:recat] = row[4]
      params[:recat_wtc_a] = row[5]
      params[:recat_wtc_b] = row[6]
      params[:cwtc] = row[7]
      params[:srs] = row[8]
      params[:lahso] = row[9]

      params[:manufacturer] = row[10]
      params[:model] = row[11]
      params[:data] = { other_models: row.drop(12).compact_blank }

      ap params
      ap AircraftTypeDesignator.upsert(params)
    end
  end
end
