# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  provider_id :bigint
#  latitude    :decimal(, )
#  longitude   :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Address < ApplicationRecord
  belongs_to :provider
end
