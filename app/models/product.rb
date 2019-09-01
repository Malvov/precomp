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
  belongs_to :provider
  belongs_to :category
  has_many_attached :images

  validates_presence_of :name, :description, :trademark, :currency
  validates_numericality_of :price, greater_than: 0, message: 'is not a number'

  scope :related_products_by_category, -> (category_id, provider_id) { 
    where('category_id = ? and provider_id != ?', category_id, provider_id).order('random()')
  }


  
  CURRENCY = ['Dólar', 'Córdoba']

  def related_products_by_provider
    provider.products.where.not(id: id).order('random()') 
  end

end
