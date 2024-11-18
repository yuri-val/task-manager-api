# == Schema Information
#
# Table name: exchange_rates
#
#  id          :uuid             not null, primary key
#  date        :date
#  rate        :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  currency_id :string(8)        not null
#
# Indexes
#
#  index_exchange_rates_on_currency_id  (currency_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#
FactoryBot.define do
  factory :exchange_rate do
    currency { nil }
    date { "2024-11-16" }
    rate { "9.99" }
  end
end
