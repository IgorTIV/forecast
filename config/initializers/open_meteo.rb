require 'open_meteo'

OpenMeteo.configure do |config|
  config.logger = Rails.logger
end
