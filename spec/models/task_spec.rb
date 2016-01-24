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

    it "is invalid without state" do
      @task.state = nil
      expect(@task).to be_invalid
    end

    it "has 'new' value in state by default" do
      expect(@task.state).to eq("new")
    end

    it "can change state from 'new' to 'started'" do
      expect_that_started
    end

    it "can change state from 'new' to 'finished'" do
      expect_that_finished
    end

    it "can change state from 'started' to 'finished'" do
      expect_that_started
      expect_that_finished
    end

    private

    def expect_that_started
      @task.start
      expect(@task.state).to eq("started")
    end

    def expect_that_finished
      @task.finish
      expect(@task.state).to eq("finished")
    end
  end
end
