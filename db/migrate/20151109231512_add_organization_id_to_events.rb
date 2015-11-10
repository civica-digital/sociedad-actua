class AddOrganizationIdToEvents < ActiveRecord::Migration
  def up
    add_column :events, :organization_id, :integer
  end

  def down
    remove_column :events, :organization_id, :integer
  end
end
