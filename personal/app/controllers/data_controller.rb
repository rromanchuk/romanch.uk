class DataController < ActionController::API
  def report
    WxStationObservation.create!(winddir: params[:winddir], windspeedmph: params[:windspeed])
  end
end