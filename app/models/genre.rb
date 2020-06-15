class Genre < ApplicationRecord
  has_many :contents
  belongs_to :user
  # accepts_nested_attributes_for :contents
  validates :name, presence: true, uniqueness: { scope: :user_id }
  
end
