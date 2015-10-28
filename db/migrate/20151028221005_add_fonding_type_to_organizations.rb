class AddFondingTypeToOrganizations < ActiveRecord::Migration
   def up
    add_column :organizations, :has_funding_private, :boolean, :default=> false
    add_column :organizations, :has_funding_public, :boolean, :default=> false
    add_column :organizations, :has_funding_auto, :boolean, :default=> false
    add_column :organizations, :has_funding_national, :boolean, :default=> false
    add_column :organizations, :has_funding_international, :boolean, :default=> false

    add_column :organizations, :rate_private, :integer
    add_column :organizations, :rate_national, :integer
    add_column :organizations, :rate_international, :integer
  end

  def down
    remove_column :organizations, :has_funding_private, :boolean, :default=> false
    remove_column :organizations, :has_funding_public, :boolean, :default=> false
    remove_column :organizations, :has_funding_auto, :boolean, :default=> false
    remove_column :organizations, :has_funding_national, :boolean, :default=> false
    remove_column :organizations, :has_funding_international, :boolean, :default=> false

    remove_column :organizations, :rate_private, :integer
    remove_column :organizations, :rate_national, :integer
    remove_column :organizations, :rate_international, :integer
  end
end
