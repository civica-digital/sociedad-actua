class RemoveAndAddColumnsToOrganizations < ActiveRecord::Migration
  def up
    remove_column :organizations, :has_funding_private, :boolean, :default=> false
    remove_column :organizations, :has_funding_public, :boolean, :default=> false
    remove_column :organizations, :has_funding_auto, :boolean, :default=> false
    remove_column :organizations, :has_funding_national, :boolean, :default=> false
    remove_column :organizations, :has_funding_international, :boolean, :default=> false

    add_column :organizations, :rate_public, :integer, default: 30
    add_column :organizations, :rate_auto, :integer, default: 40
    change_column :organizations, :rate_private, :integer, default: 30
    change_column :organizations, :rate_national, :integer, default: 50
    change_column :organizations, :rate_international, :integer, default: 50
  end

  def down
  end
end
