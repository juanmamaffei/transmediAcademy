json.extract! course, :id, :name, :description, :category, :price, :goals, :duration, :evaluation, :visibility,
              :created_at, :updated_at
json.url course_url(course, format: :json)
