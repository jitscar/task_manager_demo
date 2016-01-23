require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:each) do
    @task = build(:task)
  end

  describe "initialized in before(:each)" do
    it "can build" do
      expect(@task.name).to eq("Task 1")
    end

    it "can be created" do
      @task.save
      expect(Task.count).to eq(1)
    end

    it "is invalid without name" do
      @task.name = nil
      expect(@task).to be_invalid
    end
  end
end
