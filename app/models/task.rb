class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user, foreign_key: :owner, class_name: User

  scope :low,     -> { where(priority: 1) }
  scope :middle,  -> { where(priority: 2) }
  scope :warning, -> { where(priority: 3) }
end
