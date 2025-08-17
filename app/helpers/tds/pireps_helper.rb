module Tds
  module PirepsHelper
    def turbulence_conditions(conditions)
      capture do
        conditions.each do |t|
          concat t.values.join(' ')
          concat tag.rb
        end
      end
    end

    def msl(altitude_ft_msl)
      (altitude_ft_msl/100).to_s.rjust(3, '0') if altitude_ft_msl.is_a? Integer
    end

    def human_msl(altitude_ft_msl)
      "#{number_with_delimiter(altitude_ft_msl)}  MSL" if altitude_ft_msl
    end

    def sky_conditions(conditions)
      capture do
        conditions.each do |t|
          concat t["sky_cover"]
          if (bases = t["cloud_base_ft_msl"])
            concat " "
            concat "BASES #{msl(bases)}"
          end

          if (tops = t["cloud_top_ft_msl"])
            concat " "
            concat "TOPS #{msl(tops)}"
          end

          concat tag.br
        end
      end
    end

    def human_sky_conditions(conditions)
      capture do
        conditions.each do |t|
          concat t["sky_cover"]
          if (bases = t["cloud_base_ft_msl"])
            concat " "
            concat "BASES #{human_msl(bases)}"
          end

          if (tops = t["cloud_top_ft_msl"])
            concat " "
            concat "TOPS #{human_msl(tops)}"
          end

          concat tag.br
        end
      end
    end

    

    def flight_level(altitude_ft_msl)
      return nil unless altitude_ft_msl
      return nil  unless altitude_ft_msl.positive?

      msl(altitude_ft_msl) + ' MSL'
    end

    def flight_level?(altitude_ft_msl)
      return false unless altitude_ft_msl
      altitude_ft_msl.positive?
    end

    def icing_conditions(conditions)
      return unless conditions
      capture do 
        conditions.each do |t|
          concat t.values.join(' ')
          concat tag.br
        end
      end
    end
  end
end
