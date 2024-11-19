# == Schema Information
#
# Table name: projects
#
#  id          :uuid             not null, primary key
#  description :text
#  name        :string
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  client_id   :uuid
#
# Indexes
#
#  index_projects_on_client_id  (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#
class Project < ApplicationRecord
  belongs_to :client, optional: true

  enum :status, { active: 0, archived: 1 }, default: :active

  validates :name, presence: true, uniqueness: { scope: :client_id }
  validates :status, presence: true

  scope :common, -> { where(client: nil) }
end
