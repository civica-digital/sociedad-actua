class AddFieldsToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :address, :text
  	add_column :events, :info, :string
  	add_column :events, :causes, :string
  	add_column :events, :lat, :float
  	add_column :events, :lng, :float
  end
end
