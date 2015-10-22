class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|

      t.string :type_organization, null: false
      t.string :name, null: false
      t.datetime :remember_created_at, null: false, default: Time.now
      t.string :email, null: false

      t.string :rfc
      t.text :mision

      t.string :address
      t.string :colonia
      t.string :town
      t.integer :zip
      t.string :telephone

      t.string :site
      t.string :blog
      t.string :facebook
      t.string :twitter
      t.string :youtube
      t.string :instagram
    end
  end
end
