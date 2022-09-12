module Wx
  class Pirep < ApplicationRecord
    self.implicit_order_column = 'observation_time'

    OV = %r{/OV\s\w+}
    FL = %r{/FL(\d{3}|UNKN)}
    TP = %r{/TP\s\w{1,4}}
    SK = %r{/SK\s(\d{3}|UNKN)\s\w{3}\s\d{3}/(\d{3}|UNKN)\s\w{3}\s\d{3}}
    TA = %r{/TA\s-?\d{2}}
    WV = %r{/WV\s\d{3}\d{2,3}KT?}

    include Turbo::Broadcastable
    # include Dictionaries

    belongs_to :batch, counter_cache: :pireps_count

    # store_accessor :data, :remarks, :sa_identifier

    scope :uua, -> { where(urgent: true) }
    scope :ua, -> { where(urgent: false) }
    scope :recent, -> { order(observation_time: :desc) }

    def remarks = %r{/RM\s(?<remarks>.+)}.match(raw_text)&.[](:remarks)

    def set_geometry!
      self.location = RGeo::Geographic.spherical_factory(srid: 4326, has_z_coordinate: true).point(longitude, latitude,
                                                                                                   altitude_ft_msl)
      save!
    end

    def urgent?
      /[UA]{3}/.match?(raw_text)
    end

    # def find_dyn
    #   PilotReport.find(raw_text, range_key: receipt_time)
    # end

    # def dyn_prireps
    #   PilotReport.where(report_type: 'PIREP').scan_index_forward(false)
    # end
    # private

    # def parse_metadata!
    #   self.urgent = /[UA]{3}/.match?(raw_text)
    #   self.remarks = %r{/RM\s(?<remarks>.+)}.match(raw_text)&.[](:remarks)
    #   self.sa_identifier = /(?<identifier>^\w{3})/.match(raw_text)&.[](:identifier)
    # end
  end
end
