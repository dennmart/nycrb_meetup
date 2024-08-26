module MessagesHelper
  def generated_name(uuid)
    UuidNameGenerator::Generate.new(uuid: uuid).call
  end
end
