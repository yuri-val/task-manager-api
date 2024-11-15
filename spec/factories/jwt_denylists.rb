FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2024-11-15 23:30:21" }
  end
end
