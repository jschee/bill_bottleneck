class Bill < ApplicationRecord
  validates :congress, presence: true
  validates :bill_type, presence: true
  validates :number, presence: true, uniqueness: %i[congress bill_type]

  has_many :actions
  has_many :summaries
  has_many :text_versions

  scope :without_actions,         -> { left_joins(:actions).where(actions: { id: nil }) }
  scope :without_summaries,       -> { left_joins(:summaries).where(summaries: { id: nil }) }
  scope :without_text_versions,   -> { left_joins(:text_versions).where(text_versions: { id: nil }) }

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

  class << self
    def api_match(params)
      Bill.find_by(congress: params['congress'],
                   number: params['number'],
                   bill_type: params['type'])
    end
  end
end
