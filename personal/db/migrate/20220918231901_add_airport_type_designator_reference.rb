class AddAirportTypeDesignatorReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :wx_pireps, :aircraft_type_designator, type: :uuid, index: true
  end
end
