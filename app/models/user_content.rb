class UserContent < ApplicationRecord
  belongs_to :user
  belongs_to :content

  acts_as_votable
end
