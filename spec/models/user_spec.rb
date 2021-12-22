require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "会員情報入力" do
    # name
    it "nameが空では登録できない" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end


    # email
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user.email = FactoryBot.build(:user, email:@user.email)
      another_user.email = @user.email
      expect(another_user.email.errors.full_messages).to include('Email is invalid')
    end
    it 'emailに@を含まない場合は登録できない' do
      @user.email = 'hogehuga.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end



    # password
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが6文字以下であれば登録できない" do
      @user.password = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '英字のみのpasswordでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Encrypted password is invalid')
    end
    it '数字のみのpasswordでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Encrypted password is invalid')
    end
    it '全角英数字を含むpasswordでは登録できない' do
      @user.password = 'ＡＢｃ１２３'
      @user.password_confirmation = 'ＡＢｃ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('Encrypted password is invalid')
    end


    # first_name
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_name（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'Hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end


    # last_name
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_name（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'Hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end


    # 性フリガナ
    it 'first_name_furiganaが空では登録できない' do
      @user.first_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank")
    end
    it 'first_name_furiganaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_furigana = 'aaaa1a'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana is invalid")
    end


    # 名フリガナ
    it 'last_name_furiganaが空では登録できない' do
      @user.last_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
    end
    it 'last_name_furiganaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name_furigana = 'aaaa1a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana is invalid")
    end


    # 誕生日
    it 'date_of_birthが空では登録できない' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
  end
end