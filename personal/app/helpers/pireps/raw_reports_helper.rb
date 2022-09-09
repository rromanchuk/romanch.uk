module Pireps::RawReportsHelper
  def icao_to_human(_icao)
    hash.each { |k, v| str[k] &&= v }
  end
end
