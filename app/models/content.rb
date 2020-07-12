class Content < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  validates :title, presence: true


  # def self.search(search)
  #   return Tweet.all unless search
  #   search = "%#{search}%"
  #   Tweet.find_by_sql(["select * from tweets where text like ? ", search])
  # end

  def self.search(search)
    return Content.all unless search
    search = "%#{search}%"
    Content.find_by_sql(["select * from contents where title like ? ", search])
  end
end
