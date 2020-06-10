class Genre < ApplicationRecord
  has_many :contents
  belongs_to :user
end
