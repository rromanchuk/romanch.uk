module Wx
  class AirepsController < ApplicationController
    let(:airep) { Airep.find(params[:id]) }
    let(:aireps) { Airep.all }
  end
end
