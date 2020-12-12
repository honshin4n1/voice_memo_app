class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 8..128
         validates :name, presence: true, uniqueness: true
         validates :email, presence: true, uniqueness: true, format: { with: /\A[\x21-\x3f\x41-\x7e]+@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i }
  has_many :genres, dependent: :destroy
  has_many :contents, dependent: :destroy

  def to_param
    name
  end
end
