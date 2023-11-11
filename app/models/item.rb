class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :region
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_date

  with_options presence: true do
    validates :name
    validates :explanation
    validates :image
    validates :category_id
    validates :condition_id
    validates :delivery_charge_charge_id
    validates :prefecture_id
    validates :shipping_date_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :region_id
    validates :delivery_charge_id
    validates :delivery_date_id
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }

end
