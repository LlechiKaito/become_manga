require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  before do
    @inquiry = FactoryBot.build(:inquiry)
  end

  describe 'お問い合わせの投稿' do
    context 'お問い合わせ投稿できる場合' do
      it '全て存在していて投稿できる場合' do
        expect(@inquiry).to be_valid
      end
    end

    context 'お問い合わせ投稿できない場合' do
      it 'userのアソシエーションができていない場合登録できない場合' do
        @inquiry.user_id = nil
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include("User must exist")
      end

      it 'inquiryが空では登録できない場合' do
        @inquiry.inquiry = ''
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include("Inquiry can't be blank")
      end

      it 'inquiryが70001文字以上では登録できない場合' do
        @inquiry.inquiry = nil
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include("Inquiry は1文字以上70000文字以下にしてください")
      end
    end
  end
end
