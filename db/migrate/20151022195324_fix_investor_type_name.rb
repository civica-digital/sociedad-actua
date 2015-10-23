class FixInvestorTypeName < ActiveRecord::Migration
  def change
  	rename_column :investors, :type, :type_investor
  end
end
