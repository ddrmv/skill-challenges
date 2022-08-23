class Todo
  def initialize(task) # task is a string
    @task = task
  end

  def task
    return @task
  end

  def mark_done!
    @task = "#DONE " + @task unless self.done?
    nil
  end

  def done?
    return @task.start_with?("#DONE ")
  end
end