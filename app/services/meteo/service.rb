module Meteo
  WEATHER_CODES = YAML.load_file("#{Rails.root}/app/services/weather_codes.yml")

  class Service

    def initialize

    end

    def perform
      return {} if data.blank?

      { current: Current.new(data.current).to_h }.tap do |hash|
        data.daily.items.each do |item|
          hash[item.time] = Daily.new(item, data.daily.units).to_h
        end
      end

    end

    def data
      @data ||= OpenMeteo::Forecast.new.get(location:, variables:)
    rescue OpenMeteo::Client::ConnectionFailed, Errno::ECONNRESET
      nil
    end

    def variables
      ovariables = {
        current: %i[weather_code temperature_2m wind_speed_10m precipitation],
        daily: %i[weather_code temperature_2m_max temperature_2m_min precipitation_sum wind_speed_10m_max]
      }
    end

    def location
      OpenMeteo::Entities::Location.new(latitude: 52.52.to_d, longitude: 13.41.to_d)
    end
  end
end
