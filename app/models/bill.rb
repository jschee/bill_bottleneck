class Bill < ApplicationRecord
  validates :congress, presence: true
  validates :number, presence: true, uniqueness: [:congress]
  API = GovApi::Bill.new

  def sync_data!
    details = fetch_bill_details
    update(cached_query_response: details['bill'])
  end

  def fetch_bill_details
    API.bill(congress, bill_type, number)
  end

  def fetch_actions
    API.bill_actions(congress, bill_type, number)
  end

  def fetch_amendments
    API.bill_amendments(congress, bill_type, number)
  end

  def fetch_committees
    API.bill_committees(congress, bill_type, number)
  end

  def fetch_cosponsors
    API.bill_cosponsors(congress, bill_type, number)
  end

  def fetch_related_bills
    API.bill_related_bills(congress, bill_type, number)
  end

  def fetch_subjects
    API.bill_subjects(congress, bill_type, number)
  end

  def fetch_summaries
    API.bill_summaries(congress, bill_type, number)
  end

  def fetch_text
    API.bill_text(congress, bill_type, number)
  end

  def fetch_titles
    API.bill_titles(congress, bill_type, number)
  end
end
