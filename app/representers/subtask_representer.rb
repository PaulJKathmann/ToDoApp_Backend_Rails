class SubtaskRepresenter
    def initialize(subtask)
      @subtask = subtask
    end

    def as_json
      {
        id: subtask.id,
        name: subtask.name,
        completed: subtask.completed
      }
    end

    attr_reader :subtask
end