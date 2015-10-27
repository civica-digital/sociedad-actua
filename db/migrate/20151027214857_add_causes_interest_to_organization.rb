class AddCausesInterestToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :causes_interest, :string
  end
end
