class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :prefecture, class_name: 'Prefecture'
  belongs_to_active_hash :category, class_name: 'Category'
  belongs_to_active_hash :item_condition, class_name: 'ItemCondition'
  belongs_to_active_hash :shipping_period, class_name: 'ShippingPeriod'
  belongs_to_active_hash :postage_payer, class_name: 'PostagePayer'

  has_one_attached :image
  has_one :order

  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_period_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_payer_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  validates :image, presence: true

end
