class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  acts_as_voter
  has_many :user_contents
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" }
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
