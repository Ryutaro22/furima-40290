require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合'
    it '新規登録に必須の情報が存在すれば登録できる' do
      expect(@user).to be_valid
    end

    context '新規登録できない場合'
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.fullmessages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwords include letters and numbers")
    end

    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwords include letters and numbers")
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = '１２３４５６a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is half-width characters")
    end

    it '姓（全角）が空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("last_name can't be blank")
    end

    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is full-width characters")
    end

    it '名（全角）が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is full-width characters")
    end

    it '姓（カナ）が空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Contains characters other than kana characters")
    end

    it '名（カナ）が空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Contains characters other than kana characters")
    end

    it '生年月日が空だと登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birtth date can't be blank")
    end
  end
end
