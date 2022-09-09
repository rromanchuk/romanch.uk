class AircraftTypeDesignatorsController < ApplicationController
  before_action :set_breadcrumbs
  let(:dr_pagy)
  let(:icao_types) do
    if (q = params[:q])
      relation = AircraftTypeDesignator.search(q)
      @dr_pagy, _icao_types = pagy(relation, items: 25)
      _icao_types
    else
      relation = AircraftTypeDesignator.all
      @dr_pagy, _icao_types = pagy(relation, items: 25)
      _icao_types
    end
  end
  let(:icao_type) { AircraftTypeDesignator.friendly.find(params[:id]) }

  def index
    add_breadcrumb('Aircraft Type Designators')
  end

  def show
    add_breadcrumb('Aircraft Type Designators', aircraft_type_designators_path)
    add_breadcrumb(icao_type.icao_code)
  end

  def search; end

  private

  def set_breadcrumbs
    add_breadcrumb('Home', root_path)
  end
end
