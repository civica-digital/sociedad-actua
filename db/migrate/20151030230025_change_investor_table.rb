class ChangeInvestorTable < ActiveRecord::Migration
  def change
    remove_column :investors, :mantra
    remove_column :investors, :characteristics
    add_column :investors, :twitter_url, :string
    add_column :investors, :youtube_url, :string
    add_column :investors, :instagram_url, :string
    add_column :investors, :contact_name, :string
    add_column :investors, :legal_time, :string
  end
end
