class Content < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  validates :title, presence: true
  attr_accessor :keyword

  def self.search(search, id)
    return Content.all unless search
    search = "%#{search}%"
    Content.find_by_sql(["select * from contents where title like ? ", search])
  end

  def self.search(search, id)
    return Content.all unless search
    Content.where(['title LIKE ?', "%#{search}%"] ).where(user_id: id)
  end
end
