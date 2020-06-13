class Content < ApplicationRecord
  belongs_to :genre
  validates :title, presence: true
end
