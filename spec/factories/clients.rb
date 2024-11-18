# == Schema Information
#
# Table name: clients
#
#  id                        :uuid             not null, primary key
#  email                     :string
#  name                      :string           not null
#  rate_cents                :integer          default(0), not null
#  tax_identification_number :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  rate_currency_id          :string(8)        default("USD"), not null
#
FactoryBot.define do
  factory :client do
    name { "MyString" }
    tax_identification_number { "MyString" }
    email { "MyString" }
    rate_cents { 1 }
    currency { nil }
  end
end
