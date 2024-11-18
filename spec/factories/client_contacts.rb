# == Schema Information
#
# Table name: client_contacts
#
#  id                        :uuid             not null, primary key
#  email                     :string
#  main_contact              :boolean          default(FALSE)
#  name                      :string
#  notes                     :text
#  phone                     :string
#  position                  :string
#  tax_identification_number :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  client_id                 :uuid             not null
#
# Indexes
#
#  index_client_contacts_on_client_id  (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#
FactoryBot.define do
  factory :client_contact do
    client { nil }
    name { "MyString" }
    email { "MyString" }
    phone { "MyString" }
    position { "MyString" }
    notes { "MyText" }
    tax_identification_number { "MyString" }
  end
end
