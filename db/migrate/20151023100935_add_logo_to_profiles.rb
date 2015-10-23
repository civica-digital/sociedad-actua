class AddLogoToProfiles < ActiveRecord::Migration
  def change
    change_table :organizations do |t|
      t.string :logo
    end

    change_table :investors do |t|
      t.string :logo
    end

    change_table :collaborators do |t|
      t.string :logo
    end
  end
end
