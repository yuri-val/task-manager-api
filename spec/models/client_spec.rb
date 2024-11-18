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
require 'rails_helper'

RSpec.describe Client, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
