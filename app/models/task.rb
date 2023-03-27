class Task < ApplicationRecord
    has_many :subtasks, dependent: :destroy
    belongs_to :user

    validates :name, presence: true
    validates :completed, inclusion: { in: [true, false] }
end
