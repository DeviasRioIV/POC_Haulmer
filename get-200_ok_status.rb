#!/usr/bin/env ruby
require "uri"
require "net/http"
require 'json'

url = URI("https://dev-api.haulmer.com/v2/dte/document/47fff2b7c0c14c3a3b2e31d33535b513cf888a92092c81da55c7860bb8c505c0/status")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request["apikey"] = "928e15a2d14d4a6292345f04960f4bd3"

response = https.request(request)
puts response.read_body

# puts JSON.parse(body).to_s.gsub("=>", ":")
