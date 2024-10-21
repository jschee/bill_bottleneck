# frozen_string_literal: true

def camel_to_snake(camel_case)
  camel_case.gsub(/([A-Z])/, '_\1').downcase.sub(/^_/, '')
end

def format_bill_data(bill_json)
  {
    congress: bill_json['congress'], number: bill_json['number'],
    latest_action: bill_json['latestAction'],
    origin_chamber: bill_json['originChamber'],
    origin_chamber_code: bill_json['originChamberCode'],
    title: bill_json['title'], bill_type: bill_json['type'],
    update_date: bill_json['updateDate'],
    update_date_including_text: bill_json['updateDateIncludingText'],
    url: bill_json['url']
  }
end

def seed_bills(congress, offset = 0)
  puts "Seeding Bills #{offset} to #{offset + 250}"
  puts "If hits ERROR, change db/seed_bills.rb offset to #{offset}"
  res = GovApi::Bill.new.bills_by_congress(118, { offset: })
  bills = res['bills']
  offset += 250

  bills.each do |bill|
    Bill.create(format_bill_data(bill))
  end

  seed_bills(congress, offset) if offset < res['pagination']['count']
end

offset = 0
seed_bills(118, offset)
