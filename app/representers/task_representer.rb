class TaskRepresenter
  def initialize(task)
    @task = task
  end

  def as_json
    {
      id: task.id,
      name: task.name,
      completed: task.completed
      subtasks: task.subtasks.map { |subtask| SubtaskRepresenter.new(subtask).as_json }
    }
  end

  private

  attr_reader :task

end
