require 'rails_helper'

RSpec.describe "Tasks", type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get("/")).to route_to("tasks#index")
    end
  end
end
