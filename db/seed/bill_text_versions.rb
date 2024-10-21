# frozen_string_literal: true

require 'rest-client'
require 'nokogiri'

def text_params(text)
  text['text_type'] = text['type']
  text.delete('type')

  unless text['formats'].blank?
    htm = text['formats'].find { |x| x['type'] == 'Formatted Text' }
    xml = text['formats'].find { |x| x['type'] == 'Formatted XML' }

    text_url = htm ? htm['url'] : xml['url']
    res = RestClient.get(text_url)
    text_content = Nokogiri.parse(res.body).text
    text['text'] = text_content.to_s
  end
  text
end

def seed_texts(bill, attempt = 1)
  res = bill.fetch_text
  if res['textVersions'].blank?
    bill.text_versions << Bill::TextVersion.new(text: 'NOT YET AVAILABLE')
  else
    res['textVersions'].each do |text|
      bill.text_versions << Bill::TextVersion.new(text_params(text))
    end
  end
rescue StandardError => e
  raise e if attempt == 3

  seed_texts(bill, attempt + 1)
end

Bill.without_text_versions.each do |bill|
  next unless bill.text_versions.count.zero?

  seed_texts(bill)
end
