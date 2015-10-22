class RolifyCreateUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.references :resource, :polymorphic => true
    end

    create_table(:users_users, :id => false) do |t|
      t.references :user
      t.references :user
    end

    add_index(:users, :name)
    add_index(:users, [ :name, :resource_type, :resource_id ])
    add_index(:users_users, [ :user_id, :user_id ])
  end
end
