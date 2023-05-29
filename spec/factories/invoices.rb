# frozen_string_literal: true

FactoryBot.define do
  factory :invoice do
    invoice_number { Faker::Invoice.reference }
    invoice_date { Faker::Date.forward(days: 15) }
    total_amount_due { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    customer_name { Faker::Name.unique.name }
    customer_notes { Faker::Markdown.sandwich }
    emails { Faker::Internet.email }

    trait :invalid do
      invoice_number { nil }
      invoice_date { nil }
      total_amount_due { nil }
      customer_name { nil }
      customer_notes { nil }
      emails { nil }
      file_url { nil }
    end

    trait :with_pdf do
      file_url { Faker::Internet.url }
    end

    factory :invalid_invoice, traits: [:invalid]
    factory :invoice_with_pdf, traits: [:with_pdf]
  end
end
