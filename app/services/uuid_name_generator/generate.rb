module UuidNameGenerator
  class Generate
    def initialize(uuid:)
      @uuid = uuid
    end

    def call
      uuid_to_integer = @uuid.delete("-").to_i(16)

      left_integer = (uuid_to_integer >> 64) & 0xFFFFFFFFFFFFFFFF % ::UuidNameGenerator::LEFT.size
      right_integer = uuid_to_integer & 0xFFFFFFFFFFFFFFFF % ::UuidNameGenerator::RIGHT.size

      "#{::UuidNameGenerator::LEFT[left_integer]} #{::UuidNameGenerator::RIGHT[right_integer]}"
    end
  end
end
