class AddPositionToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :position, :string
  end
end
