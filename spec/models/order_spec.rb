require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order_residence)
  end
   
  describe 'クレジットカード情報' do
    context 'カード情報が登録できる時' do
    it "user_id,item_id, tokenを全て存在すれば登録できること" do
      expect(@order).to be_valid
    end
    end
    context 'カード情報が登録できない時' do
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
end
end
end