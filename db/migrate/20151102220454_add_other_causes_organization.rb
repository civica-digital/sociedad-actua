class AddOtherCausesOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :other_causes, :string
  end
end
