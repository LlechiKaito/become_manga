require 'rails_helper'

RSpec.describe Work, type: :model do
  before do
    @work = FactoryBot.build(:work)
  end

  describe 'workの新規登録' do
    context '新規登録できる場合' do
      it "全て存在するとき保存できる" do
        expect(@work).to be_valid
      end
      it "imageがnilでも保存できる" do
        @work.image = nil 
        expect(@work).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "main_titleが空では登録できない" do
        @work.main_title = ''
        @work.valid?
        expect(@work.errors.full_messages).to include("Main title can't be blank")
      end
      it "main_titleが100文字より多いと登録できない" do
        @work.main_title = Faker::Lorem.characters(number: 101)
        @work.valid?
        expect(@work.errors.full_messages).to include("Main title is more than 100characters")
      end
      it "explanationが空では登録できない" do
        @work.explanation = ''
        @work.valid?
        expect(@work.errors.full_messages).to include("Explanation can't be blank")
      end
      it "explanationeが70000文字より多いと登録できない" do
        @work.explanation = Faker::Lorem.characters(number: 70001)
        @work.valid?
        expect(@work.errors.full_messages).to include("Explanation is more than 70000characters")
      end
      it "category_idが1では登録できない" do
        @work.category_id = 1
        @work.valid?
        expect(@work.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
