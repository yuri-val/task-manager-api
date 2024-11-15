class CreateCurrencies < ActiveRecord::Migration[8.0]
  def change
    create_table :currencies, id: :string, limit: 8 do |t| # Currency ID (e.g., USD, EUR, GBP, etc.)
      t.integer :priority
      t.string :name
      t.string :symbol
      t.json :alternate_symbols, array: true, default: []
      t.string :disambiguate_symbol
      t.string :subunit
      t.integer :subunit_to_unit
      t.boolean :symbol_first
      t.string :iso_code, null: false
      t.string :iso_numeric
      t.string :format
      t.string :html_entity
      t.string :decimal_mark
      t.string :thousands_separator
      t.integer :smallest_denomination
      t.boolean :fetch_rate, default: false

      t.timestamps
    end

    add_index :currencies, :priority
    add_index :currencies, :iso_code
    add_index :currencies, :iso_numeric
  end
end
