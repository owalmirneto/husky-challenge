# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    access_token { SecureRandom.urlsafe_base64 }

    trait :invalid do
      email { nil }
      access_token { nil }
    end

    factory :invalid_user, traits: [:invalid]
  end
end
