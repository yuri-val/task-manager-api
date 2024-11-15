FactoryBot.define do
  factory :currency do
    code { "MyString" }
    symbol { "MyString" }
    name { "MyString" }
    fetch_rate { false }
  end
end
