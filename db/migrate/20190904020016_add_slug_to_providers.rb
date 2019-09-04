class AddSlugToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :slug, :string, uniq: true
  end
end
