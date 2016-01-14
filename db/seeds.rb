require 'factory_girl_rails'

Project.delete_all
Task.delete_all

user = User.create email: 'jump2kill@gmail.com', password: 'password', password_confirmation: 'password'

# Projects
projects = (0..15).map { FactoryGirl.create(:project_faker) }

projects.each do | project |
  project.owner = User.first.id
  project.save
end

# Tasks
tasks = (0..200).map { FactoryGirl.create(:task_faker) }

status = ['new', 'progress', 'done']

tasks.each do | task |
  task.project_id = Project.all.sample.id
  task.priority = rand(0..2)
  task.status = status[rand(0..2)]
  task.deadline = (Time.zone.now.to_date + rand(40)).to_s
  task.save
end