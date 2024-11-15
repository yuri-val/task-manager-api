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
