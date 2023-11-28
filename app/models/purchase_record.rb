class PurchaseRecord < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :record_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :region_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]+\z/}, length: { maximum: 11,minimum: 9 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code,region_id: region_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, record_id: record.id)
  end
end
