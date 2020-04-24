class Board < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :bookmark_boards, through: :bookmarks, source: :user
  mount_uploader :board_image, BoardImageUploader
  paginates_per 20

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
end
