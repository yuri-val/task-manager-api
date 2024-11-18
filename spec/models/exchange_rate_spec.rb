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
require 'rails_helper'

RSpec.describe ExchangeRate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
