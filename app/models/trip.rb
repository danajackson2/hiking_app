class Trip < ApplicationRecord
    belongs_to :trail
    belongs_to :hiker

    def get_lat
        Geocoder.search("#{self.trail.location}")[0].data["lat"]
    end

    def get_lon
        Geocoder.search("#{self.trail.location}")[0].data["lon"]
    end

    def get_start
        self.date.strftime("%F")
    end

    def weather
        response = RestClient.get("https://api.climacell.co/v3/weather/forecast/daily?lat=#{self.get_lat}&lon=#{self.get_lon}&unit_system=us&start_time=#{self.get_start}&fields=precipitation,temp,wind_speed&apikey=1kAuJpSV7MK7pkG7ngAhLWDsw23Ghmb4")
        json = JSON.parse(response.body)
        "While you are on your trip, the temperature will be low of #{(json[0]["temp"][0]["min"]["value"]).to_i}F and high of #{(json[0]["temp"][1]["max"]["value"]).to_i}F. You will have #{(json[0]["precipitation"][0]["max"]["value"]).round(2)} inches of precipitation per hour and wind speeds will be #{((json[0]["wind_speed"][0]["min"]["value"])*(json[0]["wind_speed"][1]["max"]["value"])/2).to_i} mph. Enjoy your hike!"
    end

end
