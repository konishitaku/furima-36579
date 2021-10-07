require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep 0.5
    @order = FactoryBot.build(:order_residence, user_id: @user.id, item_id: @item.id)
  end
   
  describe '購入内容' do
    context '登録できる時' do
    it "user_id,item_id, tokenを全て存在すれば登録できること" do
      expect(@order).to be_valid
    end
    it '全ての値が正しく入力されていれば購入できること' do
      expect(@order).to be_valid
    end
    it '建物名が空でも購入できること' do
      @order.building = nil
    end
    end
    context '登録できない時' do
    it "user_idがない場合は登録できないこと" do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    
    it "item_idがない場合は登録できないこと" do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    
    it "tokenがない場合は登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと購入できない' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと購入できない' do
      @order.postal_code = "1234567"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'areaが未選択だと購入できない' do
      @order.area_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include("Area Select")
    end
    it 'townが空だと購入できない' do
      @order.town = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Town can't be blank")
    end
    it 'addressが空だと購入できない' do
      @order.address= nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it 'telephone_numberが空だと購入できない' do
      @order.telephone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number can't be blank")
    end
    it 'telephone_numberが12桁では購入できない' do
      @order.telephone_number = "090123456789"
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number Telephone number can't be blank")
    end
end
end
end