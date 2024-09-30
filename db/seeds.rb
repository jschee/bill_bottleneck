# frozen_string_literal: true

require 'faker'

20.times do
  bill_post = BillPost.create(title: "#{Faker::Company.name} announces
  														#{Faker::Commerce.product_name} #{Faker::Lorem.word}",
                              description: Faker::Lorem.sentence(word_count: 6))

  rand(1..10).times do
    Vote.create(
      bill_post:,
      vote_type: %i[up_vote down_vote].sample
    )
  end

  tags = [
    'nationwide',
    'local state',
    'health',
    'finance',
    'income groups',
    'education',
    'science and technology',
    'military and veteran',
    'small businesses',
    'large coporations'
  ].shuffle

  number_of_tags = rand(1..4)

  number_of_tags.times do
    loop do
      tag = tags.sample
      unless bill_post.tags.exists?(name: tag)
        bill_post.add_tag(tag)
        break
      end
    end
  end
end
