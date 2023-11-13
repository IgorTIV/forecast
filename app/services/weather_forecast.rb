class WeatherForecast
  attr_reader :zip_code

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def perform
    return nil if !valid_zip_code? || location.blank?

    Rails.cache.fetch("meteo_#{zip_code}", expires_in: 30.minutes) do
      Meteo::Service.new(location.latitude, location.longitude).perform
    end
  end

  def location
    @location ||= Rails.cache.fetch("location_#{zip_code}") do
      Geocoder.search(zip_code).first
    end
  end

  private

  def valid_zip_code?
    zip_code.to_s =~ /\A\d{5}\z/
  end
end
