class AddColumnPhotoProjectToProject < ActiveRecord::Migration
   def up
    add_column :projects, :photo_project, :string
  end

  def down
    remove_column :projects, :photo_project, :string
  end
end

