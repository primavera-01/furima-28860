require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail,passwordとpassword_confirmation,family_nameとfirst_name,family_name_kanaとfirst_name_kana,birth_dayがあれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.nickname = "aaaaaa"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合で登録できる" do
        @user.password = "1qazxs"
        @user.password_confirmation = "1qazxs"
        expect(@user).to be_valid
      end
    end
  end


  context '新規登録がうまくいかないとき'do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合は登録できない"do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailアドレスには＠を含まなければならない"do
    @user.email = "asdfgghhhj"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
   end
    it "passwordが空だと登録できない"do
    @user.password = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下だと登録できない"do
    @user.password = "1qazx"
    @user.password_confirmation ="1qazx"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが半角英数字の混合でないと登録できない" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "family_nameが全角でないと登録できない" do
      @user.family_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name には全角文字を設定してください")
    end
    it "first_nameが全角でないと登録できない" do
      @user.first_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name には全角文字を設定してください")
    end
    it "family_name_kanaが全角カナでないと登録できない" do
      @user.family_name_kana = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana には全角カナを設定してください")
    end
    it "first_name_kanaが全角カナでないと登録できない" do
      @user.first_name_kana = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana には全角カナを設定してください")
    end
    it "生年月日が空だと登録できない" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end