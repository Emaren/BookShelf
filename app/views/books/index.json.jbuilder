json.array!(@books) do |book|
  json.extract! book, :id, :title, :body, :author
  json.url book_url(book, format: :json)
end
