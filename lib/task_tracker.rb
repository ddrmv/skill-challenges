class TaskTracker
  def initialize()
    @tasks = []
  end

  def add(task)
    @tasks << task if task != ""
  end

  def list
    return @tasks
  end
end