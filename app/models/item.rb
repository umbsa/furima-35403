class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  validates :genre_id, numericality: { other_than: 1 } 

  has_one_attached :image

  belongs_to :user
  has_one    :order

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/,
      message: "半角数字のみ使えます" }
  end

end
