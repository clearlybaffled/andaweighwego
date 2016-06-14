json.array!(@authors) do |author|
  json.extract! author, :id, :name, :username, :last_login
  json.url author_url(author, format: :json)
end
