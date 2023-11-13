module Meteo
  class Daily
    attr_reader :item, :units

    def initialize(item, units)
      @item = item
      @units = units
    end

    def to_h
      {
        weather: WEATHER_CODES[item.weather_code],
        temperature: "MIN #{item.temperature_2m_min}#{units.temperature_2m_min}, MAX #{item.temperature_2m_max}#{units.temperature_2m_max}",
        wind_speed: "#{item.wind_speed_10m_max} #{units.wind_speed_10m_max}",
        precipitation: "#{item.precipitation_sum} #{units.precipitation_sum}"
      }
    end
  end
end
