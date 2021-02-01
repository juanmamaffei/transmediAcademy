class Course < ApplicationRecord
    has_many :chapters
    has_many :contents, through: :chapters
end
