class AddSlugToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :slug, :string
    add_index :products, :slug
    add_index :providers, :slug
  end
end
