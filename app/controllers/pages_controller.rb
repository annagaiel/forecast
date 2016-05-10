class PagesController < ApplicationController
  def index
  end

  def new_town
    @region = params[:region].downcase
    @city = params[:city].downcase

    weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22
    #{params[:region].downcase}%2C%20#{params[:city].downcase}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body

    @forecasts = weather.first[1]["results"]["channel"]["item"]["forecast"]
  end

end
