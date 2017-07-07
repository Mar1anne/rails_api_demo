class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 120 }
  validates :description, presence: true, length: { maximum: 1000 }
end
