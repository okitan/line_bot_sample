require "faraday"
require "faraday_middleware/jsons"
require "faraday/for_test"

class Message
  class << self
    def create(*args)
      self.new.create(*args)
    end
  end

  def create(to, text)
    params = {
      "to" => to,
      "toChannel" => 1383378250,
      "eventType" => "138311608800106203",
      "content" => {
        "contentType" => 1,
        "toType"      => 1,
        "text"        => text,
      }
    }

    response = client.post("/v1/events", params)
    unless response.success?
      puts "-------- 8x [req] x8 --------"
      puts response.request_line
      puts response.request_headers
      puts "\n"
      puts response.request_body(true)
      puts "-------- 8x [res] x8 --------"
      puts response.status_line
      puts response.response_headers
      puts "\n"
      puts response.response_body(true)
      puts "-------- 8x [end] x8 --------"
    end
    response.must_succeed.body
  end

  protected
  def client
    Faraday::ForTest::Proxy.new(connection)
  end

  def connection
    Faraday.new("https://trialbot-api.line.me/") do |conn|
      # middleware
      conn.request  :jsons
      conn.response :jsons

      # default headers
      conn.headers["X-Line-ChannelID"]             = ENV["LINE_CHANNEL_ID"]
      conn.headers["X-Line-ChannelSecret"]         = ENV["LINE_CHANNEL_SECRET"]
      conn.headers["X-Line-Trusted-User-With-ACL"] = ENV["LINE_MID"]
      conn.headers["Content-Type"]                 = "application/json"

      if ENV["FIXIE_URL"]
        conn.proxy ENV["FIXIE_URL"]
      end

      conn.adapter :net_http
    end
  end
end
