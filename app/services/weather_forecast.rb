class WeatherForecast
  attr_reader :zip_code

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def perform
    return nil if !valid_zip_code? || location.blank?

    Meteo::Service.new(location.latitude, location.longitude).perform
  end

  def location
    Geocoder.search(zip_code).first
  end

  private

  def valid_zip_code?
    zip_code.to_s =~ /\A\d{5}\z/
  end
end
