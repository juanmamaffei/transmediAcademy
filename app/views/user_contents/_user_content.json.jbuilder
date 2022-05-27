json.extract! user_content, :id, :markdownContent, :type, :sticked, :claps, :responseTo, :user_id, :content_id,
              :created_at, :updated_at
json.url user_content_url(user_content, format: :json)
