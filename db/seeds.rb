require 'faker'
Currency.update_symbols
puts "Currencies saved..."

client_id = "422ea587-d714-4054-af67-98e2db2716aa"
client = Client.find_or_create_by(id: client_id) do |cl|
  cl.name = Faker::Name.name
  cl.rate_cents = 40000
  cl.rate_currency_id = 'UAH'
end
puts "Client saved..."
puts client.errors.full_messages if client.errors.any?

project_id = "e3bdff9d-ffef-4359-81af-d80d4218fafc"
project = Project.find_or_create_by(id: project_id) do |prj|
  prj.client = client
  prj.name = Faker::Company.name
end
puts "Project saved..."
puts project.errors.full_messages if project.errors.any?

task_id = "7c8f4367-991c-439e-b570-7d302d5a6b0e"
task = Task.find_or_create_by(id: task_id) do |tsk|
  tsk.client = client
  tsk.project = project
  tsk.name = Faker::Job.field
  tsk.date = Date.current
end
puts "Task saved..."
puts task.errors.full_messages if task.errors.any?
