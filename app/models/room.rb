class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  mount_uploader :avatar, AvatarUploader

  validates :name, :detail, :address, presence: true
  validates :fee, presence: true, numericality: { greater_than_or_equal_to: 1 }

  paginates_per 10
end
