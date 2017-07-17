class Post < ApplicationRecord
  belongs_to :user
  belongs_to :location, optional: true

  default_scope { order(created_at: :asc) }

  validates :title, presence: true, length: { maximum: 120 }
  validates :description, presence: true, length: { maximum: 1000 }
end
