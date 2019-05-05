class Provider < ApplicationRecord
    include Filterable
    scope :provider, -> (provider) { where(id: provider) }
end
