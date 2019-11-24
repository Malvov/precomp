class AddSocialNetworkLinksToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :facebook_page, :string, default: '#'
    add_column :providers, :instagram_page, :string, default: '#'
    add_column :providers, :twitter_page, :string, default: '#'
  end
end
