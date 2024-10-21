class GovApi
  # Connects to Congress Member API. Documentation: https://api.congress.gov/#/bill
  class Summary < ApiBase
    def summaries(params = {})
      get 'summaries', params.merge({ limit: 250 })
    end

    def summaries_by_congress(congress, params = {})
      get "summaries/#{congress}", params.merge({ limit: 250 })
    end

    def summaries_by_congress_bill_type(congress, bill_type, params = {})
      get "summaries/#{congress}/#{bill_type}", params.merge({ limit: 250 })
    end
  end
end
