class Order < ApplicationRecord
has_one :residence
belongs_to :user
belongs_to :item
end
