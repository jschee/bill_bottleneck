# frozen_string_literal: true

load('db/seed_congress_person.rb') if CongressPerson.count < 500
load('db/seed_bills.rb') if Bill.count < 18_155

# NOTE----------

# One bill has many of all of the following:
# Should we support all? or just some?

# actions
# amendments
# committees
# cosponsors
# related_bills
# subjects
# summaries
# text
# titles
