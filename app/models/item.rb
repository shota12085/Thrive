class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :condition
  belongs_to_active_hash :size
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :delivery_from

  belongs_to :user
  has_one :purchase
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true

  belongs_to :category

  validates :item_images, 
            :category_id, 
            :size_id, 
            :condition_id, 
            :delivery_fee_id, 
            :delivery_method_id, 
            :delivery_day_id, 
            :delivery_from_id, 
            :user_id, 
            presence: true
  validates :name, length: {maximum: 40}, presence: true
  validates :description, length: {maximum: 1000}, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}, presence: true

end