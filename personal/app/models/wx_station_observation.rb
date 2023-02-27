class WxStationObservation < WxRecord
  after_create_commit :windy_report

  def windy_report
    HTTParty.get("https://stations.windy.com/pws/update/#{Credentials[:windy_api_key]}?winddir=#{winddir}&windspeedmph=#{windspeedmph}&windgustmph=#{windgustmph}&tempf=#{tempf}&rainin=#{hrain_piezo}&baromin=#{baromrelin}&humidity=#{humidity}&uv=#{uv}&shareOption=Open")
  end
end

# CREATE TABLE public.wx_station_observations (
#   id uuid DEFAULT gen_random_uuid() NOT NULL,
#   winddir integer,
#   windspeedmph double precision,
#   windgustmph double precision,
#   maxdailygust double precision,
#   created_at timestamp(6) without time zone NOT NULL,
#   updated_at timestamp(6) without time zone NOT NULL,
#   solarradiation double precision,
#   uv integer,
#   rainratein double precision,
#   eventrainin double precision,
#   hourlyrainin double precision,
#   dailyrainin double precision,
#   weeklyrainin double precision,
#   monthlyrainin double precision,
#   yearlyrainin double precision,
#   totalrainin double precision,
#   rrain_piezo double precision,
#   erain_piezo double precision,
#   hrain_piezo double precision,
#   drain_piezo double precision,
#   wrain_piezo double precision,
#   mrain_piezo double precision,
#   yrain_piezo double precision,
#   ws90cap_volt double precision,
#   ws90_ver integer,
#   wh68batt double precision,
#   wh40batt double precision,
#   wh90batt double precision,
#   freq character varying,
#   model character varying,
#   "interval" integer,
#   tempinf double precision,
#   humidityin integer,
#   baromrelin double precision,
#   baromabsin double precision,
#   tempf double precision,
#   humidity integer
# );