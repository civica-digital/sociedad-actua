class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :name
      t.text :mantra
      t.text :characteristics
      t.string :type
      t.string :site_url
      t.string :blog_url
      t.string :facebook_url

      t.timestamps null: false
    end
  end
end
