class Point < ApplicationRecord
  belongs_to :user
  belongs_to :content
  belongs_to :test
end
