require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品機能' do
    context '出品成功する時' do
      it 'imageが1枚存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'productが存在すれば出品できる' do
        @item.product = 'プロダクト'
        expect(@item).to be_valid
      end
      it 'genre_id、condition_id、charge_id、area_id、day_idが1以外であれば出品できる' do
        @item.genre_id = 2
        @item.condition_id = 2
        @item.charge_id = 3
        @item.area_id = 45
        @item.day_id = 2
        expect(@item).to be_valid
      end
      it 'priceが300~9999999の間で存在すれば出品できる' do
        @item.price = 777_777
        expect(@item).to be_valid
      end
      it 'priceが半角数字なら出品できる' do
        @item.price = 500
        expect(@item).to be_valid
      end
    end

    context '出品失敗する時' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'productが空では出品できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'textが空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'genre_idが1では出品できない' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre must be other than 1')
      end
      it 'condition_idが1では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'charge_idが1では出品できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge must be other than 1')
      end
      it 'area_idが1では出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'day_idが1では出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300より小さい時、出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999より大きい時、出品できない' do
        @item.price = 77_777_777
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'priceが全角数字の時、出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英数混同では出品できない' do
        @item.price = '77ss'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英語だけでは出品できない' do
        @item.price = 'sss'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'user_idが空の場合、出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
