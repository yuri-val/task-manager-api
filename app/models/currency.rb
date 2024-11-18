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
class Currency < ApplicationRecord
  class << self
    def update_symbols
      Money::Currency.table.map do |code, details|
        id = code.to_s.upcase
        keys = new.attributes.keys.map(&:to_sym)

        find_or_initialize_by(id: id) do |currency|
          currency.attributes = details.slice(*keys)
          currency.save!
        end
      end
    end
  end
end
