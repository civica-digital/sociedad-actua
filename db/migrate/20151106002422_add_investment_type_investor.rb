class AddInvestmentTypeInvestor < ActiveRecord::Migration
  def change
     add_column :investors, :voluntering, :boolean
     add_column :investors, :money, :boolean
     add_column :investors, :specie, :boolean
     add_column :investors, :service, :boolean
  end
end
