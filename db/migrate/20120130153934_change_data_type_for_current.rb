class ChangeDataTypeForCurrent < ActiveRecord::Migration
  def up
    change_table :openings do |t|
      t.change :current, :text
    end
  end

  def down
    change_table :openings do |t|
      t.change :current, :string
	end
  end
end
