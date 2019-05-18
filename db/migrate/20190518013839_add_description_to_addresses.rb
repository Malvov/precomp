class AddDescriptionToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :description, :text, null: false
  end
end
