json.extract! artist, :id, :name, :year, :nationality, :created_at, :updated_at
json.url artist_url(artist, format: :json)
