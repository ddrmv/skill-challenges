require "task_tracker"

RSpec.describe TaskTracker do
  it "returns empty list initially" do
    tracker = TaskTracker.new()
    expect(tracker.list).to eq []
  end

  it "adds tasks and lists them" do
    tracker = TaskTracker.new()
    tracker.add("task 1")
    tracker.add("task 2")
    tracker.add("task 3")
    expect(tracker.list).to eq ["task 1", "task 2", "task 3"]
  end

  it "adds and lists only non-empty tasks" do
    tracker = TaskTracker.new()
    tracker.add("")
    tracker.add("task 1")
    tracker.add("")
    expect(tracker.list).to eq ["task 1"]
  end

  describe "#complete" do
    it "raises error message if task dosen't exist" do
      tracker = TaskTracker.new()
      tracker.add("task 1")
      expect { tracker.complete("task 2") }.to raise_error "Task doesn't exist."
    end

    it "marks task as complete by adding '#DONE ' and hides it from list" do
      tracker = TaskTracker.new()
      tracker.add("task 1")
      tracker.add("task 1")
      tracker.complete("task 1")
      expect(tracker.list).to eq []
    end
  end
end