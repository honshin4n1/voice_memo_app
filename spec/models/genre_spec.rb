require 'rails_helper'
describe Genre do
  describe '#create' do
    # 1
    it "nameが存在すれば登録できること" do
      genre = build(:genre)
      expect(genre).to be_valid
    end

    # 2
    it "重複したnameが存在すれば登録できないこと" do
      genre = create(:genre)
      another_genre = build(:genre, name: genre.name, user_id: genre.user.id)
      another_genre.valid?
      # binding.pry
      expect(another_genre.errors[:name]).to include("はすでに存在します")
    end

  end
end