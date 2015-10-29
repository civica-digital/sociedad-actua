class RemoveAndAddColumnsToOrganizationFunding < ActiveRecord::Migration
   def up
	remove_column :organizations, :has_funding_private, :boolean, :default=> false
    remove_column :organizations, :has_funding_public, :boolean, :default=> false
    remove_column :organizations, :has_funding_auto, :boolean, :default=> false
    remove_column :organizations, :has_funding_national, :boolean, :default=> false
    remove_column :organizations, :has_funding_international, :boolean, :default=> false

    add_column :organizations, :rate_public, :integer
    add_column :organizations, :rate_auto, :integer
  end

  def down
  end
  
end
