class AddOtherCauses < ActiveRecord::Migration
  def change
    add_column :organizations, :other_causes, :string
    add_column :collaborators, :other_causes, :string
    add_column :investors, :other_causes, :string
    add_column :projects, :other_causes, :string
    

  end
end
