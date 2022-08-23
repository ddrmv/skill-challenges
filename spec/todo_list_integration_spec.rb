require 'todo_list'
require 'todo'

RSpec.describe "integratoion of todo app" do
  
  context "initially without added todos" do

    describe "listing incomplete" do
      it "returns empty list" do
        todo_list = TodoList.new()
        expect(todo_list.incomplete).to eq []
      end
    end

    describe "listing complete" do
      it "returns empty list" do
        todo_list = TodoList.new()
        expect(todo_list.complete).to eq []
      end
    end

    describe "listing complete" do
      it "returns empty list" do
        todo_list = TodoList.new()
        expect(todo_list.complete).to eq []
      end
    end

  end

  context "with multiple entries added" do

    it "list all incomplete only" do
      todo_list = TodoList.new()
      todo_1 = Todo.new("update latop")
      todo_2 = Todo.new("exercise")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.incomplete).to eq [todo_1, todo_2]
    end

    it "give up and list all complete" do
      todo_list = TodoList.new()
      todo_1 = Todo.new("update latop")
      todo_2 = Todo.new("exercise")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.give_up!
      expect(todo_list.complete).to eq [todo_1, todo_2]
    end

  end

end