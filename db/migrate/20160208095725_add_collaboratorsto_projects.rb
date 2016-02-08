class AddCollaboratorstoProjects < ActiveRecord::Migration
  def change
    add_column :projects, :collaborators, :string
  end
end
