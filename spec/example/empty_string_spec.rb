require "rails_helper"

RSpec.describe "hello spec" do
  #Check if String.new provides an empty string
  describe String do
    let(:string) {String.new}
    it "should provide an empty string" do
      expect(string).to eq("")
    end
  end
end
