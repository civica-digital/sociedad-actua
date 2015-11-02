class AddLatLongToProject < ActiveRecord::Migration
  def change
    add_column :projects, :lat, :float
    add_column :projects, :lng, :float
  end
end
