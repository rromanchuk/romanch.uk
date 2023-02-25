class DataController < ActionController::API
  def report
    WxStationObservation.create!(winddir: params[:winddir], windspeed: params[:windspeed])
  end
end