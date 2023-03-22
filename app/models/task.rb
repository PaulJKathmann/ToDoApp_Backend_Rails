class Task < ApplicationRecord
    has_many :subtasks, dependent: :destroy

    validates :name, presence: true
    validates :completed, inclusion: { in: [true, false] }
end
