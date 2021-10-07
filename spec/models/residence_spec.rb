
require 'rails_helper'

RSpec.describe OrderResidence, type: :model do
  before do
    @order_residence = FactoryBot.build(:order_residence)
  end
  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order_residence).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it 'postal_codeが空だと購入できない' do
        @order_residence.postal_code = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @order_residence.postal_code = "1234567"
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Ppstal code is invalid. Include hyphen(-)")
      end
      it 'areaが未選択だと購入できない' do
        @order_residence.area_id = 0
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Area Select")
      end
      it 'townが空だと購入できない' do
        @order_residence.town = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Town can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order_residence.address= nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと購入できない' do
        @order_residence.telephone_number = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁では購入できない' do
        @order_residence.telephone_number = "0901234567"
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Telephone number can't be blank")
      end

    end
  end
end