require "faraday"
require "faraday_middleware/jsons"
require "faraday/for_test"

require "oj"

Faraday::ForTest::Configuration.instance.add_body_formatter("json") do |params|
  MultiJson.dump(params, pretty: true)
end
