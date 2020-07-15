class Genre < ApplicationRecord
  has_many :contents
  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user_id }
  
  # def self.search(search)
  #   return Genre.all unless search
  #   search = "%#{search}%"
  #   Genre.find_by_sql(["select * from genres where name like ? ", search])
  # end
end
