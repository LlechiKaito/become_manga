require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @relationship = FactoryBot.build(:relationship)
  end

  describe 'フォロー登録' do
    context 'ブックマーク登録できる場合' do
      it "全てのアソシエーションができている場合登録できる" do
        expect(@relationship).to be_valid
      end
    end

    context 'フォロー登録できない場合' do
      it "follower_idのアソシエーションができていない場合登録できない" do
        @relationship.follower_id = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include("Follower must exist")
      end
      it "followed_idのアソシエーションができていない場合登録できない" do
        @relationship.followed_id = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include("Followed must exist")
      end
    end
  end
end
