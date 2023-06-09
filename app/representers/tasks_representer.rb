class TasksRepresenter
  def initialize(tasks)
    @tasks = tasks
  end

  def as_json
    tasks.map do |task|
      {
        id: task.id,
        name: task.name,
        completed: task.completed,
        subtasks: task.subtasks.map { |subtask| SubtaskRepresenter.new(subtask).as_json }
      }
    end
  end

  private

  attr_reader :tasks
end
