class AddSlugToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :slug, :string
  end
end
