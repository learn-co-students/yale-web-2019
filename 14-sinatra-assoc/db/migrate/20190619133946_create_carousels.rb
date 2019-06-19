class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :name
      t.string :location
    end
  end
end
