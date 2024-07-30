class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :about
      t.date :release
      t.string :credit

      t.timestamps
    end
  end
end
