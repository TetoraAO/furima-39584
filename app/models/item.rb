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
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :region_id
    validates :delivery_charge_id
    validates :delivery_date_id
  end

end
