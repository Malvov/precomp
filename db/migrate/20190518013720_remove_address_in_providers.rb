class RemoveAddressInProviders < ActiveRecord::Migration[5.2]
  def change
    remove_column :providers, :address
  end
end
