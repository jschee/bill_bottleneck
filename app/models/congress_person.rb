class CongressPerson < ApplicationRecord
  validates :bioguide_id, presence: true, uniqueness: true

  def sync_data!
    api = GovApi::CongressPerson.new
    details = api.member(bioguide_id)['member']

    update({  birth_year: details['birthYear'],
              direct_order_name: details['directOrderName'],
              first_name: details['firstName'],
              honorific_name: details['honorificName'],
              inverted_order_name: details['invertedOrderName'],
              last_name: details['lastName'],
              state: details['state'],
              cached_query_response: details })
  end
end
