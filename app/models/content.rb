class Content < ApplicationRecord
  belongs_to :course
  belongs_to :chapter
  has_rich_text :richContent
  has_many :contents
end