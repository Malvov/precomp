# == Schema Information
#
# Table name: providers
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  max_product_quantity   :integer          default(0)
#  subscription_end_date  :date
#  phone                  :string
#  personal_contact       :string
#  administrative_contact :string
#  email                  :string
#  webpage_link           :string
#  address                :text
#  is_active              :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Provider < ApplicationRecord
    has_one :address

    accepts_nested_attributes_for :address, reject_if: :all_blank
end
