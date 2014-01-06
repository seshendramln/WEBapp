json.array!(@company_ratings) do |company_rating|
  json.extract! company_rating, :id, :user_id, :company_id, :rating
  json.url company_rating_url(company_rating, format: :json)
end
