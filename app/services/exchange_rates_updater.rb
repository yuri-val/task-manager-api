# app/services/exchange_rates_updater.rb

class ExchangeRatesUpdater
  def self.call
    new.call
  end

  def call
    fetch_rates
    update_exchange_rates
  end

  private

  def fetch_rates
    @rates = Money.default_bank.update_rates
  end

  def update_exchange_rates
    base_currency = Currency.find_by(id: Money.default_bank.source)
    return unless base_currency

    @rates.each do |currency_code, rate|
      currency = Currency.find_by(id: currency_code)
      next unless currency

      exchange_rate = ExchangeRate.find_or_initialize_by(
        currency: currency,
        date: Date.today
      )
      exchange_rate.rate = rate
      exchange_rate.save!
    end
  end
end
