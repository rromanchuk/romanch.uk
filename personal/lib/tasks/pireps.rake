namespace :pireps do
  desc "TODO"
  task ingest: :environment do
    Pireps::Ingest.call
  end

end
