require 'rails_helper'

RSpec.describe Word, type: :model do
  let(:user){ create(:user) }
  let!(:wordlist){ create(:wordlist, user_id: user.id) }
  let(:word){ build(:word, wordlist_id: wordlist.id) }
  before do
    login_as user
  end
  context 'valid situation' do
    it 'is success with valid word' do
      expect(word).to be_valid
    end
  end

  context 'invalid situation' do
    it 'is invalid without word' do
      word1 = build(:word, word:'', wordlist_id: wordlist.id)
      expect(word1).to be_invalid
    end
    it 'is invalid without parts_of_speech' do
      word1 = build(:word, parts_of_speech:'', wordlist_id: wordlist.id)
      expect(word1).to be_invalid
    end
    it 'is invalid without meaning' do
      word1 = build(:word, meaning:'', wordlist_id: wordlist.id)
      expect(word1).to be_invalid
    end
  end
end
