class AddLatLongToProject < ActiveRecord::Migration
  def change
    add_column :organizations, :lat, :float
    add_column :organizations, :lng, :float
  end
end
