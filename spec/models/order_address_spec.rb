require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'zip_code、sending_address_id、municipality、street_address、telephone_number、tokenが存在すれば登録できる' do
        expect(@order).to be_valid
      end
    end
  end

  context '商品購入がうまくいかないとき' do
    it 'zip_codeが空だと登録できない' do
      @order.zip_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip code can't be blank", 'Zip code is invalid')
    end
    it 'sending_address_idが空だと登録できない' do
      @order.sending_address_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Sending address can't be blank")
    end
    it 'municipalityが空だと登録できない' do
      @order.municipality = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'street_addressが空だと登録できない' do
      @order.street_address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Street address can't be blank")
    end
    it 'telephone_numberが空だと登録できない' do
      @order.telephone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number can't be blank")
    end
    it 'tokenが空だと登録できない' do
      @order.token = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'zip_codeにハイフンがないと登録できない' do
      @order.zip_code = '3333333'
      @order.valid?
      expect(@order.errors.full_messages).to include('Zip code is invalid')
    end
    it 'sending_address_idが1、「--」だと登録できない' do
      @order.sending_address_id = '1'
      @order.valid?
      expect(@order.errors.full_messages).to include('Sending address must be other than 1')
    end
  end
end

# bundle exec rspec spec/models/order_address_spec.rb
