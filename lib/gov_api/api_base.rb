require 'rest-client'
require 'uri'
require 'json'

class GovApi::ApiBase
  BASE_URL = 'https://api.congress.gov/v3/'.freeze
  API_KEY = Rails.application.credentials.dig(:gov_api_key)
  RATE_LIMIT = 5_000

  def get(endpoint, params = {})
    uri = build_uri(endpoint.downcase, params)
    puts "Requesting #{endpoint.downcase}"
    response = RestClient.get(uri.to_s)
    respect_rate_limit
    handle_response(response)
  end

  def post(endpoint, body = {})
    uri = URI.join(BASE_URL, endpoint)
    response = RestClient.post(uri.to_s, body)
    respect_rate_limit
    handle_response(response)
  end

  private

  def build_uri(endpoint, params)
    uri = URI.join(BASE_URL, endpoint)
    params['api_key'] = API_KEY  # Embed API key in the query parameters
    uri.query = URI.encode_www_form(params)
    uri
  end

  def handle_response(response)
    case response
    when RestClient::Response
      JSON.parse(response.body)
    else
      raise "Error: #{response.code} - #{response.message} - #{response.body}"
    end
  end

  def respect_rate_limit
    seconds_per_request = 3_600.0 / RATE_LIMIT
    sleep(seconds_per_request)
  end
end
