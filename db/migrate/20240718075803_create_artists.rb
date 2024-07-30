class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.date :year
      t.string :nationality

      t.timestamps
    end
  end
end
