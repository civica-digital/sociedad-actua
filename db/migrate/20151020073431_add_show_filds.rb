class AddShowFilds < ActiveRecord::Migration
  def change
    change_table :organizations do |t|
      t.boolean :show_address, default: false
      t.boolean :show_colonia, default: false
      t.boolean :show_town, default: false
      t.boolean :show_telephone, default: false
      t.boolean :show_zip, default: false
      t.boolean :show_email, defaul: true
    end
  end
end
