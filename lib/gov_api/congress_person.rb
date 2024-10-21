class GovApi
  # Connects to Congress Member API. Documentation: https://api.congress.gov/#/bill
  class CongressPerson < ApiBase
    def members(params = {})
      get 'member', params.merge({ limit: 250 })
    end

    def members_by_congress(congress, params = {})
      get "member/congress/#{congress}", params.merge({ limit: 250 })
    end

    def members_by_state(state_code, params = {})
      get "member/#{state_code}", params.merge({ limit: 250 })
    end

    def members_by_state_district(state_code, district, params = {})
      get "member/#{state_code}/#{district}", params.merge({ limit: 250 })
    end

    def members_by_congress_state_district(congress, state_code, district, params = {})
      get "member/congress/#{congress}/#{state_code}/#{district}", params.merge({ limit: 250 })
    end
    # =================== SINGLE MEMBER DETAILS ==============
    def member(bioguide_id)
      get "member/#{bioguide_id}"
    end

    def member_sponsored_legislation(bioguide_id)
      get "member/#{bioguide_id}/sponsored-legislation"
    end

    def member_cosponsored_legislation(bioguide_id)
      get "member/#{bioguide_id}/cosponsored-legislation"
    end
  end
end
