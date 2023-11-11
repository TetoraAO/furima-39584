require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it "商品の画像、名前、説明、カテゴリー情報、商品の状態、配送料の負担、配送元の地域、発送までの日数、価格について適切に記入すると商品を出品できる" do
        expect(@item).to be_valid
      end
      it "商品の画像が2枚以上でも商品を出品できること" do
        @item.images.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it "商品の画像がないと商品を出品できない" do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "商品名がないと商品を出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "商品の説明がないと商品を出品できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "カテゴリーの情報がないと商品を出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it "カテゴリーの情報は1以外でないと登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it "商品の状態についての情報がないと商品を出品できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it "商品の状態については1以外でないと登録できないこと" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it "配送料の負担についての情報がないと商品を出品できない" do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it "配送料の負担については1以外でないと登録できないこと" do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it "発送元の地域についての情報がないと商品を出品できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県を入力してください")
      end
      it "発送元の地域については1以外でないと登録できないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it "発送までの日数についての情報がないと商品を出品できない" do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を入力してください")
      end
      it "発送までの日数については1以外でないと登録できないこと" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数は1以外の値にしてください")
      end
      it "価格についての情報がないと商品を出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it "価格の範囲が300円未満だと商品を出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は299より大きい値にしてください")
      end
      it "価格の範囲が10,000,000以上だと商品を出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は10000000より小さい値にしてください")
      end
      it "販売価格が全角数字だと商品を出品できない" do
        @item.price = "５５５"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it "販売価格は半角英数混合では登録できないこと" do
        @item.price = "123abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it "半角英語だけでは登録できないこと" do
        @item.price = "abcdef"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
    end
  end
end
