require 'rails_helper'
describe Content do
  describe '#create' do
    # 1
    it "title、comment、start_time、displayが存在すれば登録できること" do
      content = build(:content)
      expect(content).to be_valid
    end

    # 2
    it "titleがない場合は登録できないこと" do
      content = build(:content, title: nil)
      content.valid?
      expect(content.errors[:title]).to include("を入力してください")
    end

    # 3
    it "start_timeがない場合は登録できないこと" do
      content = build(:content, start_time: nil)
      content.valid?
      expect(content.errors[:start_time]).to include("を入力してください")
    end

    # 4
    it "displayがない場合は登録できないこと" do
      content = build(:content, display: nil)
      content.valid?
      expect(content.errors[:display]).to include("を入力してください")
    end

    # 5
    it "commentがない場合でも登録できること" do
      content = build(:content, comment: nil)
      expect(content).to be_valid
    end
  end
end
