class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user, foreign_key: :owner, class_name: User

  validates :name, :text, presence: true

  scope :task_new, -> { where(status: 'new') }
  scope :progress, -> { where(status: 'progress') }
  scope :done,     -> { where(status: 'done') }

  enum priority: [ :low, :middle, :warning ]

  def to_work
    update_attribute(:status, 'progress')
  end

  def to_done
    update_attribute(:status, 'done')
  end
end
