class ChangeProviderSubscriptionEndDateToDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column :providers, :subscription_end_date, :datetime
  end
end
