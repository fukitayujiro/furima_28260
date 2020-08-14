require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "メールアドレスは@を含めば登録できる" do
        @user.email = "111@111"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で、半角英数字混合であれば登録できる" do
        @user.password = "aaa123"
        @user.password_confirmation = "aaa123"
        expect(@user).to be_valid
      end
      it "first_name、last_nameが全角(漢字、ひらがな、カタカナ)であれば登録できる" do
        @user.first_name = "山田やまだヤマダ"
        @user.last_name = "太郎たろうタロウ"
        expect(@user).to be_valid
      end
      it "first_name_kana、last_name_kanaがカタカナ全角であれば登録できる" do
        @user.first_name_kana = "ヤマダ"
        @user.last_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "@を含まないemailは登録できない" do
        @user.email = 'yamadagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = 'aa123'
        @user.password_confirmation = 'aa123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = 'aaa123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが半角英数字を含むと登録できない" do
        @user.first_name = 'a1'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "last_nameが半角英数字を含むと登録できない" do
        @user.last_name = '2'
        @user.valid?
        # trueなのでバリデーションがない。
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        # trueなのでバリデーションがない。
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        # trueなのでバリデーションがない。
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaがカタカナ全角以外では登録できない" do
        @user.first_name_kana = '山田やまだa1'
        @user.valid?
        # trueなのでバリデーションがない。
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナ文字を使用してください")
      end
      it "last_name_kanaがカタカナ全角以外では登録できない" do
        @user.last_name_kana = '太郎たろうb2'
        @user.valid?
        # trueなのでバリデーションがない。
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナ文字を使用してください")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ''
        @user.valid?
        # trueなのでバリデーションがない。
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end