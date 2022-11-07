module Wx
  module TafsHelper

    def format_raw_taf(taf)
      taf.gsub(/(FM\d{6}|BECMG|TEMPO|PROB\d{2})/, '<br/>\1').html_safe
      # taf.gsub(/(\d{6}Z)/, '<span class="text-muted">\1</span>').html_safe
    end

    def format_first_line(taf)
      format_raw_taf(taf).split('<br/>').first.html_safe
      # taf.gsub(/(\d{6}Z)/, '<span class="text-muted">\1</span>').html_safe
    end

    def wx(forecast)
      return '' unless forecast.is_a? Hash
      return '' unless forecast["wx_string"]
      ''
    end

    # The expected prevailing visibility is forecast in statute miles and
    # fractions of statute miles followed by SM to note the units of measure.
    # Statute miles followed by fractions of statute miles are separated with a
    # space, for example, 1 1/2SM. Forecast visibility greater than 6 statute
    # miles is indicated by coding P6SM. Directional or variable visibility is
    # not forecasted and the visibility group is omitted if missing.
    def visibility(forecast)
      return '' unless forecast.is_a? Hash
      return '' unless forecast["visibility_statute_mi"]

      sm = forecast["visibility_statute_mi"].to_f
      return "P6SM" if sm > 6.0
      return "#{forecast["visibility_statute_mi"]}SM" if sm.modulo(1) == 0
    end

    # Wind: ie. (14008KT) The wind group includes forecast surface winds. The
    # surface wind is the expected wind direction (first three digits) and speed
    # (last two or three digits if 100 knots or greater). The contraction KT
    # follows to denote the units of wind speed in knots. Wind gusts are noted
    # by the letter G appended to the wind speed followed by the highest
    # expected gust (two or three digits if 100 knots or greater).
    #
    # Calm winds (three knots or less) are encoded as 00000KT.
    #
    # Variable winds are encoded when it is impossible to forecast a wind
    # direction due to winds associated with convective activity or low wind
    #   speeds. A variable wind direction is noted by VRB where the three digit
    # direction usually appears.
    #
    # Examples:
    # 18010KT - Wind one eight zero at one zero knots
    # 35012G20KT - Wind three five zero at one two gust two zero knots
    # 00000KT - Wind calm VRB16G28KT - Wind variable at one six gust two eight knots
    def wind(forecast)
      return '' unless forecast.is_a? Hash
      return '' unless forecast["wind_speed_kt"]

      wind_dir = forecast["wind_dir_degrees"]&.to_i == 0 ? "VRB" : forecast["wind_dir_degrees"]

      if forecast["wind_gust_kt"]
        "#{wind_dir}#{forecast["wind_speed_kt"].rjust(2, '0')}G#{forecast["wind_gust_kt"]}KT"
      else
        "#{wind_dir}#{forecast["wind_speed_kt"].rjust(2, '0')}KT"
      end
    end

    # TAF sky condition forecasts use the METAR format. Cumulonimbus clouds (CB)
    # are the only cloud type forecast in TAFs. When the sky is obscured due to
    # a surface-based phenomenon, vertical visibility (VV) into the obscuration
    # is forecast. The format for vertical visibility is VV followed by a
    # three-digit height in hundreds of feet. Note: Ceiling layers are not
    # designated in the TAF code. For aviation purposes, the ceiling is the
    # lowest broken or overcast layer or vertical visibility into a complete
    # obscuration.
    def conditions(forecast)
      return '' unless forecast.is_a? Hash
      return '' unless forecast["sky_condition"]

      forecast["sky_condition"]&.flatten&.map {|sky| sky.values.join("") }.join(" ")
    end

    # The following change indicators are used when either a rapid, gradual, or
    # temporary change is expected in some or all of the forecast meteorological
    # conditions. Each change indicator marks a time group within the TAF
    # report.
    #
    # The FM group is used when a rapid change, usually occuring in less than
    # one hour, in prevailing conditions is expected. Typically, a rapid change
    # of prevailing conditions to more or less a completely new set of
    # prevailing conditions is associated with a synoptic feature passing
    # through the terminal area (cold or warm frontal passage). Appended to the
    # FM indicator is the four-digit hour and minute the change is expected to
    # begin and continues until the next change group or until the end of the
    # current forecast. A FM group will mark the beginning of a new line in a
    # TAF report. Each FM group contains all the required elements -- wind,
    # visibility, weather, and sky condition. Weather will be omitted in FM
    # groups when it is not significant to aviation. FM groups will not include
    # the contraction NSW.
    #
    # BECOMING Group: ie. (BECMG 2224)
    #
    # The BECMG group is used when a gradual change in conditions is expected
    # over a longer time period, usually two hours. The time period when the
    # change is expected is a four-digit group with the beginning hour and
    # ending hour of the change period which follows the BECMG indicator. The
    # gradual change will occur at an unspecified time within this time period.
    # Only the conditions are carried over from the previous time group.
    def change_indicator(forecast)
      return '' unless forecast.is_a? Hash

      case forecast["change_indicator"]
      when 'FM'
        time_from = Time.parse(forecast["fcst_time_from"])
        "#{forecast["change_indicator"]}#{time_from&.strftime("%d%H%M")}"
      when 'TEMPO'
        time_from = Time.parse(forecast["fcst_time_from"])
        time_to = Time.parse(forecast["fcst_time_to"]) 
        "#{forecast["change_indicator"]} #{time_from&.strftime("%d%H")}/#{time_to&.strftime("%d%H")}"
      when 'BECMG'
        time_from = Time.parse(forecast["fcst_time_from"]) 
        time_to = Time.parse(forecast["fcst_time_to"]) 
        time_becoming = Time.parse(forecast["time_becoming"])
        "#{forecast["change_indicator"]} #{time_becoming&.strftime("%d%H")}/#{time_to&.strftime("%d%H")}"
      when 'PROB'
        ""
      else
        time_from = Time.parse(forecast["fcst_time_from"])
        time_to = Time.parse(forecast["fcst_time_to"]) 
        "#{time_from&.strftime("%d%H")}/#{time_to&.strftime("%d%H")}"
      end
    end
  end
end