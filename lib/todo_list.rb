class TodoList
  def initialize
    @todos = []
  end

  def add(todo) # todo is an instance of Todo
    @todos << todo
  end

  def incomplete
    @todos.reject { |entry| entry.done? }
  end

  def complete
    @todos.select { |entry| entry.done? }
  end

  def give_up!
    @todos.map { |todo| todo.mark_done! }
  end
end