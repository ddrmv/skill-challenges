require 'todo'

RSpec.describe Todo do
  
  describe "#task" do
    it "returns the created task" do
      todo = Todo.new("make lunch")
      expect(todo.task).to eq "make lunch"
    end
  end

  describe "#mark_done!" do
    it "mark as done if not already marked as done" do
      todo = Todo.new("make lunch")
      expect(todo.mark_done!).to eq nil
      expect(todo.task).to eq "#DONE make lunch"
    end

    it "leave as is if already marked as done" do
      todo = Todo.new("#DONE make lunch")
      expect(todo.mark_done!).to eq nil
      expect(todo.task).to eq "#DONE make lunch"
    end
  end

end