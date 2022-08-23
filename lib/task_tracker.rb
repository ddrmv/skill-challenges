class TaskTracker
  def initialize()
    @tasks = []
  end

  def add(task)
    @tasks << task if task != ""
  end

  def list
    return @tasks.select { |task| task[0,6] != "#DONE " }
  end

  def complete(task)
    if !@tasks.include?(task)
      raise "Task doesn't exist."
    else
      @tasks = @tasks.map do |list_task|
        list_task == task ? "#DONE " + list_task : list_task
      end
    end
  end
end