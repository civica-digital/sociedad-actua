class UpdateOrganization < ActiveRecord::Migration
  def change
   
    change_column_null :organizations, :name, true
    change_column_null :organizations, :type_organization, true


  end
end
