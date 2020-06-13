class Genre < ApplicationRecord
  has_many :contents, inverse_of: :genre
  belongs_to :user
  accepts_nested_attributes_for :contents
  validates :name, presence: true 
  
end
