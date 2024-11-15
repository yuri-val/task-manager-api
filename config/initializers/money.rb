# encoding : utf-8
require "money/bank/open_exchange_rates_bank"

MoneyRails.configure do |config|
  config.default_currency = :usd

  config.add_rate "USD", "USD", 1.0

  config.register_currency = {
    priority:            1,
    iso_code:            "USD",
    name:                "United States Dollar",
    symbol:              "$",
    symbol_first:        true,
    subunit:             "Cent",
    subunit_to_unit:     100,
    thousands_separator: ",",
    decimal_mark:        "."
  }

  config.currency_column = {
    prefix: "",
    postfix: "_currency_id",
    column_name: nil,
    type: :string,
    present: true,
    null: false,
    default: "USD",
    limit: 8
  }


  # Money::OpenExchangeRates.app_id = ENV["OPEN_EXCHANGE_RATES_APP_ID"]

  Money.default_bank = Money::Bank::OpenExchangeRatesBank.new
  Money.default_bank.app_id = ENV["OPEN_EXCHANGE_RATES_APP_ID"]
  Money.default_bank.ttl_in_seconds = 86400
end
