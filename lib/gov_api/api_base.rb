require 'rest-client'
require 'uri'
require 'json'

class GovApi::ApiBase
  BASE_URL = 'https://api.congress.gov/v3/'.freeze
  API_KEY = Rails.application.credentials.dig(:gov_api_key)

  def get(endpoint, params = {})
    uri = build_uri(endpoint.downcase, params)
    puts "Requesting #{uri}"
    response = RestClient.get(uri.to_s)
    handle_response(response)
  end

  def post(endpoint, body = {})
    uri = URI.join(BASE_URL, endpoint)
    response = RestClient.post(uri.to_s, body)
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
end
