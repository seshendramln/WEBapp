json.array!(@user_views) do |user_view|
  json.extract! user_view, :id, :company_id, :user_id
  json.url user_view_url(user_view, format: :json)
end
