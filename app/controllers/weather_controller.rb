class WeatherController < ApplicationController
  def zip_code
    service = WeatherForecast.new(params[:zip_code])
    @forecast = service.perform
    @address = service.location.address
  end
end
