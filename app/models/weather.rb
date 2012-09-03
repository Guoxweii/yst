#encoding: utf-8
class Weather < Bubble::Entry
  auto_page_attrs :title, :released_at, :extra1, :extra2, :extra3, :code
  Weather_arr = [["雪","snow"],["雷","thunder"],["雨","rain"],["多云","cloudy"],["晴","sunshine"]]
  before_save :get_style

  def self.get_weather
    client = Savon.client("http://webservice.webxml.com.cn/WebServices/WeatherWS.asmx?wsdl")
    response = client.request(:get_weather) do
      soap.body = {:theUserID => "", :theCityCode => 2013}
    end

    data = response.body[:get_weather_response][:get_weather_result][:string]
    day = Date.today
    temperature = data[4].scan (/今日天气实况：气温：([^℃]+)℃；/)
    stack = Bubble::Stack.where(:code => "weather").first

    day1 = Weather.where(:title => day).first || Weather.new
    day1.stack = stack
    day1 = day1.update_attributes({
      :released_at => "2000/01/01".to_time,
      :title => day.to_s,
      :extra1 => temperature.flatten.first,
      :extra3 => data[7].split(" ").last,
      :extra2 => data[8].gsub("/","~")
    })

    day2 = Weather.where(:title => day.next_day).first || Weather.new
    day2.stack = stack
    day2.update_attributes({
      :released_at => "2000/01/01".to_time,
      :title => day.next_day.to_s,
      :extra2 => data[13].gsub("/","~"),
      :extra3 => data[12].split(" ").last
    })

    day3 = Weather.where(:title => day.next_day(2)).first || Weather.new
    day3.stack = stack
    day3.update_attributes({
      :released_at => "2000/01/01".to_time,
      :title => day.next_day(2).to_s,
      :extra2 => data[18].gsub("/","~"),
      :extra3 => data[17].split(" ").last
    })

    day4 = Weather.where(:title => day.next_day(3)).first || Weather.new
    day4.stack = stack
    day4.update_attributes({
      :released_at => "2000/01/01".to_time,
      :title => day.next_day(3).to_s,
      :extra2 => data[23].gsub("/","~"),
      :extra3 => data[22].split(" ").last
    })

    day5 = Weather.where(:title => day.next_day(4)).first || Weather.new
    day5.stack = stack
    day5.update_attributes({
      :released_at => "2000/01/01".to_time,
      :title => day.next_day(4).to_s,
      :extra2 => data[28].gsub("/","~"),
      :extra3 => data[27].split(" ").last
    })

  end

  def get_style
    if self.extra3.present?
      Weather_arr.each do |weather|
        if self.extra3.index(weather[0])
          self.code = weather[1]
          return
        end
      end
    end
  end
end