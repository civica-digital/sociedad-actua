class AddColumnsToInvestors < ActiveRecord::Migration
  def change
  	add_column :investors, :address, :string
    add_column :investors, :neighborhood, :string
    add_column :investors, :city, :string
    add_column :investors, :telephone, :string
    add_column :investors, :zipcode, :string
    add_column :investors, :email, :string
  end
end
