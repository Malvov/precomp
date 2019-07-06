class RemoveTimeSpanFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :time_span
    change_column :products, :estimated_delivery_time, :string
  end
end
