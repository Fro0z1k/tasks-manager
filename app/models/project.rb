class Project < ActiveRecord::Base
  belongs_to :user, foreign_key: :owner, class_name: User
  has_many :tasks
end
