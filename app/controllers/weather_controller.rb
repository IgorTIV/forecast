class WeatherController < ApplicationController
  def zip_code
    @forecast = Meteo::Service.new.perform
  end
end
