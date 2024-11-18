# == Schema Information
#
# Table name: currencies
#
#  id                    :string(8)        not null, primary key
#  alternate_symbols     :json             is an Array
#  decimal_mark          :string
#  disambiguate_symbol   :string
#  fetch_rate            :boolean          default(FALSE)
#  format                :string
#  html_entity           :string
#  iso_code              :string           not null
#  iso_numeric           :string
#  name                  :string
#  priority              :integer
#  smallest_denomination :integer
#  subunit               :string
#  subunit_to_unit       :integer
#  symbol                :string
#  symbol_first          :boolean
#  thousands_separator   :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_currencies_on_iso_code     (iso_code)
#  index_currencies_on_iso_numeric  (iso_numeric)
#  index_currencies_on_priority     (priority)
#
require 'rails_helper'

RSpec.describe Currency, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
