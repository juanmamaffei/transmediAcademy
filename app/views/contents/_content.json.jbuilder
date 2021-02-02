json.extract! content, :id, :course_id, :chapter_id, :name, :sequence, :typeOfContent, :richContent, :priority, :testId, :requirements, :minimumScore, :goals, :created_at, :updated_at
json.url content_url(content, format: :json)
