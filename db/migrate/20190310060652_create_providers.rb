class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :contact
      t.integer :max_product_quantity
      t.datetime :subscription_end_date
      t.string :phone
      t.string :personal_contact
      t.string :administrative_contact
      t.string :email
      t.string :webpage_link
      t.string :address
      t.boolean :is_active

      t.timestamps
    end
  end
end
