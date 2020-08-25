require 'rails_helper'
describe Address do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "建物名除く項目が全て埋まっている時" do
        expect(@address).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it "postal_codeが空の時" do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンがない時" do
        @address.postal_code = "1111111"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code ハイフン含む7桁の数字で入力してください")
      end
      it "phone_numberが空の時" do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberに数字以外が含まれる時" do
        @address.phone_number = "00-11112222"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number 使用できるのは11桁未満の数字のみです")
      end
      it "phone_numberが12桁以上の数字の時" do
        @address.phone_number = "000011112222"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number 使用できるのは11桁未満の数字のみです")
      end
      it "cityが空の時" do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it "addressesが空の時" do
        @address.addresses= nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Addresses can't be blank")
      end
      it "prefectures_idが1の時" do
        @address.prefectures_id = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefectures can't be blank")
      end
    end
  end
end