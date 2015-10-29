class RemoveNullValidationFromOrganizations < ActiveRecord::Migration
  def change
    change_column_null :organizations, :name, true
    change_column_null :organizations, :type_organization, true
    change_column_null :organizations, :email, true
  end
end
