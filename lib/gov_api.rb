require 'rest-client'

class GovApi
  class << self
    def bill
      @client = Bill.new(BASE_URL, API_KEY)
    end
  end
end
