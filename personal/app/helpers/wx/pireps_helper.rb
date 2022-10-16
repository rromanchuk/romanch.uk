module Wx
  module PirepsHelper
    def turbulence_conditions(conditions)
      conditions.map do |t|
        t.values.join(' ')
      end.join("<br />").html_safe
    end

    def sky_conditions(conditions)
      conditions.map do |t|
        t.values.join(' ')
      end.join("<br />").html_safe
    end

    def icing_conditions(conditions)
      conditions.map do |t|
        t.values.join(' ')
      end.join("<br />").html_safe
    end
  end
end