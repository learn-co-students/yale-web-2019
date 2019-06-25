class CreateRollercoasters < ActiveRecord::Migration[5.1]
  def change
    create_table :rollercoasters do |t|
      t.string :name
      t.integer :length
      t.integer :height
      t.string :location

      t.timestamps
    end
  end
end
