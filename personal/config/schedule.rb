job_type :crunner, "cd /var/www/romanch.uk/current && bin/rails runner -e :environment ':task' :output"

every 5.minutes do # 1.minute 1.day 1.week 1.month 1.year is also supported
  # the following tasks are run in parallel (not in sequence)
  crunner 'PgHero.capture_query_stats'
end

every 1.day do
  crunner 'PgHero.capture_space_stats'
end

every 15.minutes do
  crunner 'Wx::Pireps::Ingest.call'
end

every 30.minutes do
  crunner 'Wx::Metars::Ingest.call'
  crunner 'Wx::Tafs::Ingest.call'
end
