class AddCausesToProjects < ActiveRecord::Migration
  def change
  	  add_column :projects, :causes_interest, :string
  end
end
