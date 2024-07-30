class Artist < ApplicationRecord
    has_rich_text :biography

    has_many :artist_songs, dependent: :destroy
    has_many :songs, through: :artist_songs

    validates :name, presence: true

end