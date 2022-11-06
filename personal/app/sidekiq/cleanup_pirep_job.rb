class CleanupPirepJob
  include Sidekiq::Job

  def perform(pirep_id)
    Wx::Pirep.find_by(id: pirep_id)&.tap do |pirep|
      pirep.cleanup
      pirep.save!
    end
  end
end