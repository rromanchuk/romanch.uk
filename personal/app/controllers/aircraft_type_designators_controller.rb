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
    add_breadcrumb(title)
    render stream: true
  end

  def show
    add_breadcrumb(title, aircraft_type_designators_url)
    add_breadcrumb("#{icao_type.icao_code} #{icao_type.manufacturer} \"#{icao_type.model}\"")
    render stream: true
  end

  def search; end

  private

  def set_breadcrumbs
    add_breadcrumb('Home', root_url)
  end

  def title = 'DOC 8643 - Aircraft Type Designators'
end
