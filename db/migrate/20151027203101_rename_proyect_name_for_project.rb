class RenameProyectNameForProject < ActiveRecord::Migration
def change
    rename_table :proyects, :projects
  end
end
