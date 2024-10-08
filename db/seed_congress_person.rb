# frozen_string_literal: true

def camel_to_snake(camel_case)
  camel_case.gsub(/([A-Z])/, '_\1').downcase.sub(/^_/, '')
end

def seed_members(congress)
  api = GovApi::CongressPerson.new

  members = []
  3.times do |i|
    offset = i * 250
    puts "calling congress api...#{i + 1}"
    res = api.members_by_congress(congress, { offset: offset })
    members += res['members']
  end

  members.each do |member|
    CongressPerson.create(bioguide_id: member['bioguideId'], inverted_order_name: member['name'], state: member['state'], url: member['url'])
  end
end

def detailed_congress_person_data
  CongressPerson.all.each do |congress_person|
    congress_person.sync_data!
  end
end


seed_members(118)






