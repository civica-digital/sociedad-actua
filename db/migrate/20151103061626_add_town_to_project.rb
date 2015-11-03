class AddTownToProject < ActiveRecord::Migration
   def up
    add_column :projects, :town, :string
  end

  def down
    remove_column :projects, :town, :string
  end
end
