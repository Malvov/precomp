# == Schema Information
#
# Table name: providers
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  max_product_quantity   :integer          default(0)
#  subscription_end_date  :datetime
#  phone                  :string
#  personal_contact       :string
#  administrative_contact :string
#  email                  :string
#  webpage_link           :string
#  is_active              :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :bigint
#  slug                   :string
#

class Provider < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :history

    has_many :addresses
    has_many :products
    belongs_to :user
    has_one_attached :logo

    validates_presence_of :name, :phone, :personal_contact, :administrative_contact, :email
    validates_uniqueness_of :name

    after_save :set_user_as_provider
    before_save :set_slug

    scope :actives, -> { where is_active: true }

    private

    def set_user_as_provider
        user.update role: if is_active then :provider else :gues end
    end
end
