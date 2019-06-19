class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :color
      t.integer :carousel_id
    end
  end
end
