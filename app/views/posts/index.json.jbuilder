json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body
  json.start post.created_at
  json.end post.created_at
  json.url post_url(post, format: :html)
end
