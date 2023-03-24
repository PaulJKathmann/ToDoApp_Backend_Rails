class SubtasksRepresenter
    def initialize(subtasks)
      @subtasks = subtasks
    end

    def as_json
        subtasks.map do |subtask|
            {
                id: subtask.id,
                name: subtask.name,
                completed: subtask.completed,
                task_id: subtask.task_id
            }
        end
    end

    attr_reader :subtasks
end