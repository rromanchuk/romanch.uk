class Pireps::IngestJob
  include Sidekiq::Job

  def perform(*args)
    Pireps::Ingest.call
  end
end
