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
class Task < ApplicationRecord
  belongs_to :client
  belongs_to :project
  belongs_to :rate_currency, class_name: "Currency"
  belongs_to :assigned_to, class_name: "User", optional: true

  monetize :rate_cents, with_model_currency: :rate_currency_id

  before_save :set_default_values_from_client

  def estimated_cost
    return Money.new(0, rate_currency_id) if estimated_hours.blank?

    rate * estimated_hours
  end

  def actual_cost
    return Money.new(0, rate_currency_id) if spent_hours.blank?

    rate * spent_hours
  end

  private

  def set_default_values_from_client
    self.date ||= Date.current
    self.rate_currency_id = client.rate_currency_id if rate_cents.zero?
    self.rate_cents = client.rate_cents if rate_cents.zero?
  end
end
