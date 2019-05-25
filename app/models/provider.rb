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
#  is_active              :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Provider < ApplicationRecord
    has_many :addresses
    has_one_attached :logo

#     after_save :scale_image

#   def scale_image
#     resized_image = MiniMagick::Image.read logo.download
#     resized_image.resize '180x180!'
#     logo.attach io: File.open(resized_image.path), filename: logo.filename, content_type: logo.content_type
#   end

    def thumbnail
        logo.variant(resize: '180x180!').processed
    end

end
