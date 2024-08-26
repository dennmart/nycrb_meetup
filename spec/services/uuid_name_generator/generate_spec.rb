require 'rails_helper'

RSpec.describe UuidNameGenerator::Generate, type: :service do
  describe "#call" do
    it "converts a UUID to 64-bit integers and uses it to generate a string from UuidNameGenerator::LEFT and UuidNameGenerator::RIGHT" do
      # TODO: Write a better spec for this.
      uuid = SecureRandom.uuid
      generator = UuidNameGenerator::Generate.new(uuid: uuid)
      expect(generator.call).to be_a(String)
    end
  end
end
