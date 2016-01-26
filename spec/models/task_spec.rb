require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) {
    FactoryGirl.build(:task)
  }

  describe "object" do
    it "can be created" do
      expect { task.save! }.to change(Task, :count).by(1)
    end

    it "has 'new' value in state by default" do
      expect(task.state).to eq("new")
    end

    describe "can change state" do
      it "from 'new' to 'started'" do
        expect { task.start }.to change(task, :state).from("new").to("started")
      end

      it "from 'new' to 'finished'" do
        expect { task.finish }.to change(task, :state).from("new").to("finished")
      end

      it "from 'started' to 'finished'" do
        task.start
        expect { task.finish }.to change(task, :state).from("started").to("finished")
      end

      it "#started? true when start" do
        expect { task.start }.to change(task, :started?).to true
      end

      it "#finished? true when finish" do
        expect { task.finish }.to change(task, :finished?).to true
      end
    end
  end

  describe "is invalid" do
    it "without name" do
      task.name = nil
      expect(task).to be_invalid
    end

    it "is invalid without state" do
      task.state = nil
      expect(task).to be_invalid
    end
  end

  it "is completely valid" do
    expect(task).to be_valid
  end
end
