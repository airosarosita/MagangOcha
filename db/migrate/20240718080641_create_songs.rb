class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.date :release
      t.string :composer
      t.string :producer

      t.timestamps
    end
  end
end
