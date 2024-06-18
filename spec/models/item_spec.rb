require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテムの保存' do
    context 'アイテムが出品できる場合' do
      it '出品に必須な情報が存在すれば投稿できる' do
        expect(@item).to be_valid
      end
    end

    context 'アイテムが出品できない場合' do
      it '商品名が空では投稿できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品説明が空では出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'カテゴリーに「---」が選択されていると出品できない' do
        @item.category = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'コンディションに「---」が選択されていると出品できない' do
        @item.item_condition = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item Condition can't be blank")
      end

      it '配送料の負担に「---」が選択されていると出品できない' do
        @item.postage_payer = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end

      it '発送までの日数に「---」が選択されていると出品できない' do
        @item.shipping_period = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping period can't be blank")
      end

      it '発送元の地域に「---」が選択されていると出品できない' do
        @item.prefecture = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '価格が空では出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item Price can't be blank")
      end

      it '価格が300以下では出品できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than 299")
      end

      it '価格が9999999以上では出品できない' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than 10000000")
      end

      it '価格が半角数値以外では出品できない' do
        @item.item_price = '５５５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end

      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
