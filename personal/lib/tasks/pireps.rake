namespace :pireps do
  desc 'TODO'
  task ingest: :environment do
  end

  desc 'csv'
  task ingest: :environment do
    csv = CSV.generate(headers: true) do |csv|
      csv << Wx::Pirep.attribute_names
      Wx::Pirep.find_each do |pirep|
        csv << pirep.attributes.values
      end
    end
    puts csv
  end
end
