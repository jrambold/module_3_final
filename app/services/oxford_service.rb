class OxfordService
  def initialize
    @headers = { "app_id" => ENV['app_id'], "app_key" => ENV['app_key'], "Accept" => "application/json" }
  end

  def get_url(url)
    response = conn.get(url)
    if response.headers["content-type"].start_with?("application/json")
      JSON.parse(response.body, symbolize_names: true)
    else
      nil
    end
  end

  private
    attr_reader :headers

    def conn
      Faraday.new('https://od-api.oxforddictionaries.com', headers: headers)
    end
end
