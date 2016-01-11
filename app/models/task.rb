class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user, foreign_key: :owner, class_name: User

  scope :low,         -> { where(priority: 0) }
  scope :middle,      -> { where(priority: 1) }
  scope :warning,     -> { where(priority: 2) }
  scope :task_new,    -> { where(status: 'new') }
  scope :progress,    -> { where(status: 'progress') }
  scope :done,        -> { where(status: 'done') }

  enum priority: [ :low, :middle, :warning ]
end
