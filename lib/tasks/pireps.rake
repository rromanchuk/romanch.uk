# frozen_string_literal: true

namespace :pireps do
  desc 'csv'
  task ingest: :environment do
    csv = CSV.generate(headers: true) do |csv|
      csv << Tds::Pirep.attribute_names
      Tds::Pirep.find_each do |pirep|
        csv << pirep.attributes.values
      end
    end
    puts csv
  end

  desc 'calculate dirived fields'
  task cleanup: :environment do
    
  end

  desc 'migrate'
  task migrate: :environment do
    
  end
end
