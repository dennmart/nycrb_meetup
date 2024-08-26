class Message < ApplicationRecord
  validates :uuid, presence: true
  validates :content, presence: true
end
