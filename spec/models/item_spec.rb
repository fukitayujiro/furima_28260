require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('camera.png')
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it "項目が全て埋まっている時" do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかない時' do
      it "imageが空の時" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空の時" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explainが空の時" do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it "category_idが空の時" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが1の時" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "item_status_idが空の時" do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it "item_status_idが1の時" do
        @item.item_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
      end
      it "sending_charge_idが空の時" do
        @item.sending_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending charge can't be blank")
      end
      it "sending_charge_idが1の時" do
        @item.sending_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending charge must be other than 1")
      end
      it "sending_region_idが空の時" do
        @item.sending_region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending region can't be blank")
      end
      it "sending_region_idが1の時" do
        @item.sending_region_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending region must be other than 1")
      end
      it "sending_day_idが空の時" do
        @item.sending_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending day can't be blank")
      end
      it "sending_day_idが1の時" do
        @item.sending_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending day must be other than 1")
      end
      it "priceが空の時" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceの値が10000000以上の時" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it "priceの値が300未満の時" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
    end
  end
end