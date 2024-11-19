# == Schema Information
#
# Table name: tasks
#
#  id               :uuid             not null, primary key
#  date             :date
#  description      :text
#  estimated_hours  :decimal(, )
#  name             :string
#  rate_cents       :integer          default(0), not null
#  spent_hours      :decimal(, )
#  status           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  assigned_to_id   :uuid
#  client_id        :uuid             not null
#  project_id       :uuid             not null
#  rate_currency_id :string(8)        default("USD"), not null
#
# Indexes
#
#  index_tasks_on_assigned_to_id  (assigned_to_id)
#  index_tasks_on_client_id       (client_id)
#  index_tasks_on_project_id      (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (assigned_to_id => users.id)
#  fk_rails_...  (client_id => clients.id)
#  fk_rails_...  (project_id => projects.id)
#
require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
