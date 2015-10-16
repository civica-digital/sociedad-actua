class AddProfileUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :profile, :polymorphic => true, :index => true
    end
  end
end
