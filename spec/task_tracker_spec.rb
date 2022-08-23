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
end