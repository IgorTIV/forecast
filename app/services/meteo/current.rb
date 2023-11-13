module Meteo
  class Current
    attr_reader :item, :units

    def initialize(current)
      @item = current.item
      @units = current.units
    end

    def to_h
      {
        weather: WEATHER_CODES[item.weather_code],
        temperature: "#{item.temperature_2m}#{units.temperature_2m}",
        wind_speed: "#{item.wind_speed_10m} #{units.wind_speed_10m}",
        precipitation: "#{item.precipitation} #{units.precipitation}"
      }
    end
  end
end
