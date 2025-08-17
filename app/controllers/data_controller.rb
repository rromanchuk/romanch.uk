class DataController < ActionController::API
  
  def report
    WxStationObservation.create!(winddir: params[:winddir],
      windspeedmph: params[:windspeedmph],
      windgustmph: params[:windgustmph],
      maxdailygust: params[:maxdailygust],
      tempinf: params[:tempinf],
      humidityin: params[:humidityin],
      baromrelin: params[:baromrelin],
      baromabsin: params[:baromabsin],
      tempf: params[:tempf],
      humidity: params[:humidity],
      solarradiation: params[:solarradiation],
      uv: params[:uv],
      rainratein: params[:rainratein],
      eventrainin: params[:eventrainin],
      hourlyrainin: params[:hourlyrainin],
      dailyrainin: params[:dailyrainin],
      weeklyrainin: params[:weeklyrainin],
      monthlyrainin: params[:monthlyrainin],
      yearlyrainin: params[:yearlyrainin],
      totalrainin: params[:totalrainin],
      rrain_piezo: params[:rrain_piezo],
      erain_piezo: params[:erain_piezo],
      hrain_piezo: params[:hrain_piezo],
      drain_piezo: params[:drain_piezo],
      wrain_piezo: params[:wrain_piezo],
      mrain_piezo: params[:mrain_piezo],
      yrain_piezo: params[:yrain_piezo],
      ws90cap_volt: params[:ws90cap_volt],
      ws90_ver: params[:ws90_ver],
      wh68batt: params[:wh68batt],
      wh40batt: params[:wh40batt],
      wh90batt: params[:wh90batt],
      freq: params[:freq],
      model: params[:model],
      interval: params[:interval]
    )
    head 200
  end
end

