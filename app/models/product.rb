# == Schema Information
#
# Table name: products
#
#  id                      :bigint           not null, primary key
#  name                    :string
#  tags                    :string           is an Array
#  description             :string
#  trademark               :string
#  measurement_unit        :string
#  estimated_delivery_time :integer
#  provider_id             :bigint
#  price                   :decimal(, )
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :provider
  validates_presence_of :name, :tags, :description, :trademark, :measurement_unit, :price
end
