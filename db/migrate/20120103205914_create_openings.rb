class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.string :name
      t.text :objective

      t.timestamps
    end
  end
end
