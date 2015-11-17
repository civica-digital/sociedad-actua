class AddOrganizationToInvestor < ActiveRecord::Migration
  def change
      add_column :investors, :organization, :string
  end
end
