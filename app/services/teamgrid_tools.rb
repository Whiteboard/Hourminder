require 'uri'
require 'net/http'
require 'net/https'
require 'json'
module TeamgridTools

  def req_headers
    { Authorization: "Bearer zp6FSbaoC45uH2oNeDxCj56Eh" }
  end

  def parse_uri(endpoint)
    URI.parse(endpoint)
  end

  def get_hours_for_user(user)
    req_params = {
      limit: 999999,
      userId: user.teamgrid_uid,
      startFrom: (Date.today - Date.today.wday).beginning_of_day.strftime("%Y-%m-%d")
    }
    uri = parse_uri("https://api.teamgridapp.com/times")

    uri.query = URI.encode_www_form(req_params)
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true

    req = Net::HTTP::Get.new(uri.request_uri)
    req.initialize_http_header(req_headers)

    res = https.request(req)
    es = JSON.parse(res.body)["data"]
    return 0 if es.nil?
    hours = es.select{|e| !(e["end"].nil? || e["start"].nil?) }.map {|e|
      (DateTime.parse(e["end"]).to_time.to_i - DateTime.parse(e["start"]).to_time.to_i) / 60 / 60.0
    }.inject(0, :+)
    hours
  end

  def get_team_users
    req_params = { limit: 50 }
    uri = parse_uri("https://api.teamgridapp.com/teams")

    uri.query = URI.encode_www_form(req_params)
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true

    req = Net::HTTP::Get.new(uri.request_uri)
    req.initialize_http_header(req_headers)

    res = https.request(req)
    es = JSON.parse(res.body)["data"]
  end
end
