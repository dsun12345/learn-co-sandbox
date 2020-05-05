class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :genre
      t.string :release_date
    end 
  end
end