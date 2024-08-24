module Tds
  class AircraftTypeDesignatorsController < ApplicationController
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:icao_types) do
      relation = AircraftTypeDesignator.all
      relation = apply_search(relation)
      @dr_pagy, _icao_types = pagy(relation, items: 25)
      _icao_types
    end
    
    let(:icao_type) { AircraftTypeDesignator.friendly.find(params[:id]) }

    def index
      add_breadcrumb(title)
    end

    def show
      add_breadcrumb(title, tds_aircraft_type_designator_url)
      add_breadcrumb("#{icao_type.icao_code} #{icao_type.manufacturer} \"#{icao_type.model}\"")
    end

    def new
      add_breadcrumb(title, tds_aircraft_type_designators_url)
      add_breadcrumb('New')
    end

    def search; end

    private

    def title = 'DOC 8643 - Aircraft Type Designators'


    def apply_search(relation)
      if (q = params[:q])
        relation.search(q)
      else
        relation
      end
    end
  end
end
