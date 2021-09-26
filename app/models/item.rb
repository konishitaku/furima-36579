class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  belongs_to_active_hash :load
  belongs_to_active_hash :status
  belongs_to_active_hash :category

  with_options presence: true do
    validates :image
    validates :merchandise
    validates :text
    validates :price
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  validates :price, numericality: { only_integer: true, message: "Half-width number." }
  validates :status_id, numericality: { other_than: 0, message: "Select" }
  validates :load_id, numericality: { other_than: 0, message: "Select" }
  validates :area_id, numericality: { other_than: 0, message: "Select" }
  validates :day_id, numericality: { other_than: 0, message: "Select" }
  validates :category_id, numericality: { other_than: 0, message: "Select" }
end
