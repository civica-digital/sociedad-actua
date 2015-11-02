class AddCausesToCollaborator < ActiveRecord::Migration
  def change
    add_column :collaborators, :causes_interest, :string
  end
end
