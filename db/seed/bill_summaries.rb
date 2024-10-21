# frozen_string_literal: true

def seed_summaries(bill, attempt=1)
  res = bill.fetch_summaries
  if res['summaries'].blank?
    bill.summaries << Bill::Summary.new(text: 'NO AVAILABLE SUMMARIES')
  else
    res['summaries'].each do |summary|
      bill.summaries << Bill::Summary.new(summary)
    end
  end

rescue StandardError => e
  raise e if attempt == 3

  seed_summaries(bill, attempt + 1)
end

Bill.without_summaries.each do |bill|
  next unless bill.summaries.count.zero?

  seed_summaries(bill)
end
