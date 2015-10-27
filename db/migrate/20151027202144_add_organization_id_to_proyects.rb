class AddOrganizationIdToProyects < ActiveRecord::Migration
   def up
    add_column :proyects, :organization_id, :integer
  end

  def down
    remove_column :proyects, :organization_id, :integer
  end
end
