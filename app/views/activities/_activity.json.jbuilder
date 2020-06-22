json.extract! activity, :id, :title, :description, :requirements, :date, :volunteer_count, :img_url, :created_at, :updated_at
json.url activity_url(activity, format: :json)
