json.extract! lead, :id, :user, :status, :course, :name, :email, :info, :created_at, :updated_at
json.url lead_url(lead, format: :json)
