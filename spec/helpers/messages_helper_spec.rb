require 'rails_helper'

# describe MessagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MessagesHelper, type: :helper do
  describe "#generated_name" do
    it "calls the UuidNameGenerator::Generate service object" do
      uuid = SecureRandom.uuid
      generator_double = instance_double("UuidNameGenerator::Generate", call: "Generated Name")

      expect(UuidNameGenerator::Generate).to receive(:new).with(uuid: uuid).and_return(generator_double)
      expect(helper.generated_name(uuid)).to eq("Generated Name")
    end
  end
end
