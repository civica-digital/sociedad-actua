class AddClasificationToProject < ActiveRecord::Migration
  def change
    add_column :projects, :clasification, :string
  end

end
