class AddMissingFieldsToInvestor < ActiveRecord::Migration
  def change
  	add_column :investors, :investment_type, :string
    add_column :investors, :amount, :string
    add_column :investors, :constitution, :boolean
    add_column :investors, :expense_type, :string
  end
end
