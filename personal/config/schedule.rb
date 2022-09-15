every 5.minutes do # 1.minute 1.day 1.week 1.month 1.year is also supported
  # the following tasks are run in parallel (not in sequence)
  runner 'PgHero.capture_query_stats'
end

every 1.day do
  runner 'PgHero.capture_space_stats'
end

every 15.minutes do
  runner 'Wx::Pireps::Ingest.call'
end

every 30.minutes do
  runner 'Wx::Metars::Ingest.call'
  runner 'Wx::Tafs::Ingest.call'
end
