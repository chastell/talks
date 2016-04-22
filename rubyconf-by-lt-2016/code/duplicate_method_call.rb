require 'ostruct'

class Conference
  def initialize(city, weather_source: WeatherSource.new)
    @city           = city
    @weather_source = weather_source
  end

  def weather_assessment
    if @weather_source.weather_at(@city).skies == :clear
      'Too sunny'
    elsif @weather_source.weather_at(@city).temp > 20
      'Too hot'
    else
      'Perfect for coding'
    end
  end
end

class Conference
  def weather_assessment
    weather = @weather_source.weather_at(@city)
    if weather.skies == :clear
      'Too sunny'
    elsif weather.temp > 20
      'Too hot'
    else
      'Perfect for coding'
    end
  end
end

weather_source = Object.new
def weather_source.weather_at(_)
  OpenStruct.new(skies: %i(clear clouded).sample, temp: rand(20..21))
end

p Conference.new('Porto', weather_source: weather_source).weather_assessment
