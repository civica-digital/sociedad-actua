class CreateCollaborator < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.string :name
      t.string :type_collaborator
      t.text :description
      t.string :email
      t.string :site_url
      t.string :facebook_url
      t.string :instagram_url
      t.string :twitter_url
      t.string :youtube_url
      t.string :blog_url
    end
  end
end
