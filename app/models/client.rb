class Client < ApplicationRecord
  belongs_to :rate_currency, class_name: "Currency"

  monetize :rate_cents, with_model_currency: :rate_currency_id
end
