class CreateAlbumSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :album_songs do |t|
      t.belongs_to :album, null: false, foreign_key: true
      t.belongs_to :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
