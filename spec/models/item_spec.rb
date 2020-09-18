require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "item_name、detail、price、condition_id、category_id、delivery_charge_id、
      delivery_time_id、sending_address_id、imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
  end

  context '商品出品がうまくいかないとき' do
    it 'item_nameが空だと登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'detailが空では登録できない' do
      @item.detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end
    it 'priceが空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'condition_idが空だと登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'category_idが空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'delivery_charge_idが空だと登録できない' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it 'delivery_time_idが空だと登録できない' do
      @item.delivery_time_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery time can't be blank")
    end
    it 'sending_address_idが空だと登録できない' do
      @item.sending_address_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Sending address can't be blank")
    end
    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'priceが全角だと登録できない' do
      @item.price = '００００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceの値が指定範囲外だと登録できない①' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceの値が指定範囲外だと登録できない②' do
      @item.price = '99999999'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it 'category_idが1、「--」だと登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'condition_idが1、「--」だと登録できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it 'delivery_charge_idが1、「--」だと登録できない' do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
    end
    it 'delivery_time_idが1、「--」だと登録できない' do
      @item.delivery_time_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
    end
    it 'sending_address_idが1、「--」だと登録できない' do
      @item.sending_address_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Sending address must be other than 1")
    end


  end
end
