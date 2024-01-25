# frozen_string_literal: true

FactoryBot.define do
  factory :campaign do
    title { Faker::Marketing.buzzwords }
    description { Faker::Lorem.paragraph }
    state { Campaign.states_keys.sample }
    publication_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    position { Campaign.count + 1 }
  end
end
