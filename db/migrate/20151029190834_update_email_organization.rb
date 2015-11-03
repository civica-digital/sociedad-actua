class UpdateEmailOrganization < ActiveRecord::Migration
  def change
    change_column_null :organizations, :email, true
  end
end
