class Content < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  validates :title, presence: true
  attr_accessor :keyword

  default_scope -> { order(created_at: :desc) }

  def self.search(search, id)
    return Content.all unless search
    Content.where(['title LIKE ?', "%#{search}%"] ).where(user_id: id)
  end
  
end
