class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :tags
      t.string :description
      t.string :trademark
      t.string :measurement_unit
      t.integer :estimated_delivery_time
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
