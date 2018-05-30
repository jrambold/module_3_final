class OxfordService
  def initialize
    @headers = { app_id: ENV['API_ID'], app_key: ENV['API_KEY'], Accept: "application/json" }
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :headers

    def conn
      Faraday.new('https://od-api.oxforddictionaries.com/api/v1', headers: headers)
    end
end
