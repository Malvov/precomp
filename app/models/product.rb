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
#  time_span               :string
#  provider_id             :bigint
#  price                   :decimal(, )
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  category_id             :bigint
#

class Product < ApplicationRecord
  belongs_to :provider, optional: true
  belongs_to :category
  validates_presence_of :name, :tags, :description, :trademark, :measurement_unit, :price
  validates_numericality_of :price, greater_than: 0, message: 'is not a number'

  TIME_SPANS = ['Horas', 'Días', 'Meses']
end
