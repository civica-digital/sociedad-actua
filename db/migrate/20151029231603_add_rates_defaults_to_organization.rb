class AddRatesDefaultsToOrganization < ActiveRecord::Migration
  def change
    change_column :organizations, :rate_private, :integer, default: 0
    change_column :organizations, :rate_national, :integer, default: 0
    change_column :organizations, :rate_international, :integer, default: 0
  end
end
