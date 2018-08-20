json.extract! post, :id, :title, :content, :hashtag, :lat, :lng, :x, :y, :created_at, :updated_at
json.url post_url(post, format: :json)
