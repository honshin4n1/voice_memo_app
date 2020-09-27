class Content < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  validates :title, presence: true
  validates :start_time, presence: true
  validates :display, presence: true
  attr_accessor :keyword

  default_scope -> { order(updated_at: :DESC) }

  def self.search(search, id)
    return Content.all unless search
    Content.where(['title LIKE ?', "%#{search}%"] ).where(user_id: id)
  end
  
end
