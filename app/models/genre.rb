class Genre < ApplicationRecord
  has_many :contents
  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user_id }
  
end
