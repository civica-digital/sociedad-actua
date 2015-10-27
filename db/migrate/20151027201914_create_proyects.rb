class CreateProyects < ActiveRecord::Migration
  def change
    create_table :proyects do |t|
      t.string :name
      t.text :goals
      t.text :description
      t.string :status
      t.text :direction
      t.text :comments_from_direction
      t.string :name_of_owner
      t.text :email
      t.string :phone
      t.text :webside
      t.text :facebook
      t.text :twitter

      t.timestamps null: false
    end
  end
end
