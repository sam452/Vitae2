class AddCurrentToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :current, :string
  end
end
