# frozen_string_literal: true

namespace :metars do
  desc 'calculate dirived fields'
  task cleanup: :environment do
    Wx::Metar.find_each do |metar|
      metar.cleanup
      metar.save!
    end
  end
end