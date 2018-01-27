class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :body, presence: true, length: { maximum: 100_00 }
end
