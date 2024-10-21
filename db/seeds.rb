# frozen_string_literal: true

# NOTE: GOV API Rate Limit is 5,000 / hour.

load('db/seed/congress_person.rb')    if CongressPerson.count < 500
load('db/seed/bills.rb')              if Bill.count < 18_155
load('db/seed/bill_actions.rb')       if Bill.without_actions.count.positive?
load('db/seed/bill_text_versions.rb') if Bill.without_text_versions.count.positive?
load('db/seed/bill_summaries.rb')     if Bill.without_summaries.count.positive?

# NOTE----------

# One bill has many of all of the following:
# Should we support all? or just some?

# actions       --- SUPPORTED
# summaries     --- SUPPORTED
# text          --- SUPPORTED
# amendments    --- Maybe? What benefit would amendment level data bring?
# committees    --- bill details already include an array of committee details,
#                   is there additional benefit (ex: aggregate data) that we can
#                   get from adding a committee model and linking the relationship
#                   with a bill?
# cosponsors    --- Don't think we need this since we want to focus on content
#                   rather than party.
# related_bills --- Could be useful, but maybe in a V2/V3 when have a practical reason
# subjects      --- Not sure if useful.
# titles        --- Not sure if title history is useful. Only most recent title
#                   is necessary in my opinion.
