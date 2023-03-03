class WxStationObservationsController < ApplicationController
  let(:wxr_station_observations) do
    relation = WxStationObservation.recent
    @dr_pagy, records = pagy_countless(relation, items: 50)
    records
  end
end