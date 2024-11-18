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
class Client < ApplicationRecord
  belongs_to :rate_currency, class_name: "Currency"

  has_many :client_contacts, dependent: :destroy
  has_many :projects, dependent: :destroy

  monetize :rate_cents, with_model_currency: :rate_currency_id

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  after_create :create_main_contact

  private

  def create_main_contact
    client_contacts.create!(name:, email:, tax_identification_number:, main_contact: true)
  end
end
