class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.text :notes
      t.decimal :price
      t.string :image

      t.timestamps null: false
    end
  end
end
