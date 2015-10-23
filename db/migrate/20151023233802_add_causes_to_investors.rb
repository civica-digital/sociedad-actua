class AddCausesToInvestors < ActiveRecord::Migration
  def change
  	add_column :investors, :causes_supported, :string
  end
end
