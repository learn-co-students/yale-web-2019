class WhyPrince < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :length
      t.integer :artist_id
      t.integer :genre_id
    end

    create_table :genres do |t|
      t.string :name
    end
  end
end
