FactoryBot.define do
  factory :client do
    name { "MyString" }
    tax_identification_number { "MyString" }
    email { "MyString" }
    rate_cents { 1 }
    currency { nil }
  end
end
