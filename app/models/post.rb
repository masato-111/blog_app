class Post < ApplicationRecord
  validates :title, presence: true
  validates :image, content_type: [ "image/png", "image/jpeg", "image/gif" ]
  has_one_attached :image

  def excerpt(length: 60)
    description.to_s.truncate(length)
  end

  def formatted_created_at
    created_at.strftime("%Y年%m月%d日 %H:%M")
  end
end
