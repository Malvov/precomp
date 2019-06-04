# == Schema Information
#
# Table name: products
#
#  id                      :bigint           not null, primary key
#  name                    :string
#  tags                    :string
#  description             :string
#  trademark               :string
#  measurement_unit        :string
#  estimated_delivery_time :integer
#  provider_id             :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :provider
end
