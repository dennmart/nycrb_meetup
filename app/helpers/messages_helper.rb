module MessagesHelper
  include Pagy::Frontend

  def generated_name(uuid)
    UuidNameGenerator::Generate.new(uuid: uuid).call
  end
end
