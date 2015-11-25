class ChangeProjectsAssociation < ActiveRecord::Migration
  def change
    add_column :projects, :projectable_id, :integer
    add_column :projects, :projectable_type, :string
  end
end
