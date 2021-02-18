class Micropost < ApplicationRecord
  belongs_to       :user
  has_many    :comments, dependent: :destroy
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :title,   presence: true, length: { maximum: 40 }
  validates :game_category, presence: true, length: { maximum: 40 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "有効な画像ではありません" },
                                      size: { less_than: 5.megabytes,
                                      message: "5MB以下にしてください" }

  # 表示用のりサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end