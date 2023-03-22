class Subtask < ApplicationRecord
  belongs_to :task

  validates_associated :task, presence: true
end
