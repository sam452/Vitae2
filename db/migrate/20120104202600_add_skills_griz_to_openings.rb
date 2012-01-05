class AddSkillsGrizToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :skills, :text
    add_column :openings, :grizzard, :text
    add_column :openings, :company, :string
  end
end
