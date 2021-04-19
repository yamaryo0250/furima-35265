class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product
    validates :text
    validates :image
    with_options format: { with: /\A[0-9]+\z/ } , numericality: {greater_than_or_equal_to: 300,less_than: 10000000} do
      validates :price
    end
  end
  with_options numericality: { other_than: 1 } do
    validates :genre_id
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :day_id
  end
end
