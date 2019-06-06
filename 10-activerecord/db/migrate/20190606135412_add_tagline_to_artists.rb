class AddTaglineToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :tag_line, :string
  end
end
