module Wx
  class MetarsController < ApplicationController
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:metar) { Metar.find(params[:id]) }
    let(:metars) do
      add_breadcrumb('All')
      relation = Metar.recent.includes(:batch)
      @dr_pagy, _metars = pagy(relation, items: 50)
      _metars
    end

    def set_breadcrumbs
      add_breadcrumb('Home', root_path)
    end
  end
end
