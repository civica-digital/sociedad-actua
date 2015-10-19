class ChangeZipType < ActiveRecord::Migration
  def change
    def up
      change_column :organizations, :zip, :string
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
