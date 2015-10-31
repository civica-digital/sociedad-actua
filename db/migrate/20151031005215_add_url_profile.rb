class AddUrlProfile < ActiveRecord::Migration
  def change
    add_column :organizations, :profile_url, :string
  end
end
