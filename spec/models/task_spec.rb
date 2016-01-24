require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) {
    FactoryGirl.build(:task)
  }

  describe "model" do
    it "can be created" do
      expect { task.save! }.to change(Task, :count).from(0).to(1)
    end

    it "has 'new' value in state by default" do
      expect(task.state).to eq("new")
    end

    it "can change state from 'new' to 'started'" do
      expect { task.start }.to change(task, :state).from("new").to("started")
    end

    it "can change state from 'new' to 'finished'" do
      expect { task.finish }.to change(task, :state).from("new").to("finished")
    end

    it "can change state from 'started' to 'finished'" do
      task.start
      expect { task.finish }.to change(task, :state).from("started").to("finished")
    end
  end

  describe "with current validation" do
    it "is invalid without name" do
      task.name = nil
      expect(task).to be_invalid
    end

    it "is invalid without state" do
      task.state = nil
      expect(task).to be_invalid
    end

    it "is completely valid" do
      expect(task).to be_valid
    end
  end
end
