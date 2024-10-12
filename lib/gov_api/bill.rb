class GovApi
  # Connects to Bill API. Documentation: https://api.congress.gov/#/bill
  class Bill < ApiBase
    def bills(params = {})
      get 'bill', params.merge({ limit: 250 })
    end

    def bills_by_congress(congress, params = {})
      get "bill/#{congress}", params.merge({ limit: 250 })
    end

    def bills_by_congress_bill_type(congress, bill_type, params = {})
      get "bill/#{congress}/#{bill_type}", params.merge({ limit: 250 })
    end

    # ===========SINGLE BILL DETAILS=================

    def bill(congress, bill_type, bill_number)
      get "bill/#{congress}/#{bill_type}/#{bill_number}"
    end

    def bill_actions(congress, bill_type, bill_number, params = {})
      get "bill/#{congress}/#{bill_type}/#{bill_number}/actions", params.merge({ limit: 250 })
    end

    def bill_amendments(congress, bill_type, bill_number, params = {})
      get "bill/#{congress}/#{bill_type}/#{bill_number}/amendments", params.merge({ limit: 250 })
    end

    def bill_committees(congress, bill_type, bill_number, params = {})
      get "bill/#{congress}/#{bill_type}/#{bill_number}/committees", params.merge({ limit: 250 })
    end

    def bill_cosponsors(congress, bill_type, bill_number, params = {})
      get "bill/#{congress}/#{bill_type}/#{bill_number}/cosponsors", params.merge({ limit: 250 })
    end

    def bill_related_bills(congress, bill_type, bill_number, params = {})
      get "bill/#{congress}/#{bill_type}/#{bill_number}/relatedbills", params.merge({ limit: 250 })
    end

    def bill_subjects(congress, bill_type, bill_number, params = {})
      get "bill/#{congress}/#{bill_type}/#{bill_number}/subjects", params.merge({ limit: 250 })
    end

    def bill_summaries(congress, bill_type, bill_number, params = {})
      get "bill/#{congress}/#{bill_type}/#{bill_number}/summaries", params.merge({ limit: 250 })
    end

    def bill_text(congress, bill_type, bill_number, params = {})
      get "bill/#{congress}/#{bill_type}/#{bill_number}/text", params.merge({ limit: 250 })
    end

    def bill_titles(congress, bill_type, bill_number, params = {})
      get "bill/#{congress}/#{bill_type}/#{bill_number}/titles", params.merge({ limit: 250 })
    end
  end
end
