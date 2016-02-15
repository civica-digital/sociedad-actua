class AddSupportsToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :supports, :string
  end
end
