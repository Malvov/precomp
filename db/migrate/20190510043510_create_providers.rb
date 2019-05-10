class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name
      t.integer :max_product_quantity, default: 0
      t.date :subscription_end_date
      t.string :phone
      t.string :personal_contact
      t.string :administrative_contact
      t.string :email
      t.string :webpage_link
      t.text :address
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
