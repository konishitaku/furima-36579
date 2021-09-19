require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
       it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '000000a'
        @user.password_confirmation = '000000a'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
     it 'nicknameが空では登録できない' do
      @user.nickname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
     it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
     end
     it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
     end
     it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
     end
     it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
     end
     it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
     end
     it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
     end
     it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
     it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it 'birthdayが空では登録できない' do
     @user.birthday = ''
     @user.valid?
     expect(@user.errors.full_messages).to include "Birthday can't be blank"
     end
     it 'emailに@が含まれない場合は登録できない' do
      @user.email = 'abcdefg.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
     end
     it 'passwordが半角英数字混合でなければ登録できない(英字のみ)' do
      @user.password = 'asdzxc'
      @user.password_confirmation = 'asdzxc'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
     end
     it 'passwordが半角英数字混合でなければ登録できない(数字のみ)' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
     end
     it 'passwordが半角でなければ登録できない' do
      @user.password = 'ＡＢｃ１２３'
      @user.password_confirmation = 'ＡＢｃ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
     end
     it 'last_nameが全角文字でなければ登録できない' do
      @user.last_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Input full-width characters')
     end
     it 'first_nameが全角文字でなければ登録できない' do
      @user.first_name = 'huga'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Input full-width characters')
     end
     it 'last_name_kanaが全角カタカナでなければ登録できない' do
      @user.last_name_kana = 'あああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Input full-width katakana characters')
     end
     it 'first_name_kanaが全角カタカナでなければ登録できない' do
      @user.first_name_kana = 'ｱｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Input full-width katakana characters')
     end
    end
  end
end