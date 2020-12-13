class Genre < ApplicationRecord
  has_many :contents, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user_id }

  def to_param
    name
  end
end
