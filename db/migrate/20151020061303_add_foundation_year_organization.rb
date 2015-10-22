class AddFoundationYearOrganization < ActiveRecord::Migration
  def change
    change_table :organizations do |t|
      t.integer :foundation, default: Time.now.year
    end
  end
end
