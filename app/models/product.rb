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
#  estimated_delivery_time :string
#  provider_id             :bigint
#  price                   :decimal(, )
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  category_id             :bigint
#  currency                :string
#

class Product < ApplicationRecord
  # what a really bad practice omg

  belongs_to :provider
  belongs_to :category
  validates_presence_of :name, :description, :trademark, :currency
  validates_numericality_of :price, greater_than: 0, message: 'is not a number'

  has_many_attached :images
  
  CURRENCY = ['Dólar', 'Córdoba']

end
