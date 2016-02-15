class AddFundingBooleanToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :has_funding_national, :boolean
    add_column :organizations, :has_funding_international, :boolean
  end
end
