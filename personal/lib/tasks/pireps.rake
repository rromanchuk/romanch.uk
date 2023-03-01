# frozen_string_literal: true

namespace :pireps do
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

  desc 'calculate dirived fields'
  task cleanup: :environment do
    Wx::Pirep.find_each do |pirep|
      pirep.cleanup
      pirep.save!
    end
  end

  desc 'migrate'
  task migrate: :environment do
    Wx::Batch.aircraftreports.complete.find_each do |batch|
      ap Tds::Batch.create_with(id: batch.id, key: batch.key, report_type: batch.report_type, source_url: batch.source_url, content_length: batch.content_length).find_or_create_by!(key: batch.key)
      ap batch.destroy
      # unless tds_batch.processed_at
      #   Tds::Pireps::Process.call(tds_batch.id)
      # end
      sleep 1
    end
  end
end
