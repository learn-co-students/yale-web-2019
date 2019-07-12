class CreateCompliments < ActiveRecord::Migration[5.2]
  def change
    create_table :compliments do |t|
      t.string :message
      t.integer :hug_count, default: 0

      t.timestamps
    end
  end
end
