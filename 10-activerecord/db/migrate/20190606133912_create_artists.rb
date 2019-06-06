# Make sure to put your version of the migration after
# ActiveRecord::Migration
class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      # All of the columns names and their data type
      # ***first datatype and then the name of the column
      t.string :name
    end
  end
end
