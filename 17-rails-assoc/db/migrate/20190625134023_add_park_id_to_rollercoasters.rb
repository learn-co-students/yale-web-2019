class AddParkIdToRollercoasters < ActiveRecord::Migration[5.1]
  def change
    add_column :rollercoasters, :park_id, :integer
  end
end
