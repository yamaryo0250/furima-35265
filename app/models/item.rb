class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product
    validates :genre_id
    validates :text
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :day_id
    validates :image
    with_options format: { with: /\A[0-9]+\z/ } , numericality: {greater_than_or_equal_to: 300,less_than: 10000000} do
      validates :price
    end
  end
end
