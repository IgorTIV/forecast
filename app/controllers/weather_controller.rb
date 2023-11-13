class WeatherController < ApplicationController
  def index
  end

  def zip_code
    @pulled_from_cache = Rails.cache.exist?("meteo_#{params[:zip_code]}")

    service = WeatherForecast.new(params[:zip_code])
    @forecast = service.perform

    if @forecast.blank?
      flash[:alert] = 'Zip code is incorrect'
      redirect_to action: :index and return
    end

    @address = service.location.address
  end
end
