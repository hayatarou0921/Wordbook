require 'rails_helper'

RSpec.describe User, type: :model do
  let(:wordlist){ create(:wordlist) }

  context 'valid parameters' do
    it 'is valid with title' do
      expect(wordlist).to be_valid
    end
  end
  
  context 'valid parameters' do
    it 'is invalid without title' do
      wl = build(:wordlist, title: nil)
      expect(wl).to be_invalid
    end
    it 'is invalid with duplicate title' do
      wordlist
      wordlist2 = build(:wordlist)
      expect(wordlist2).to be_invalid
    end
    it 'is invalid with over 100character title' do
      wordlist1 = build(:wordlist, title: 'a'*101)
      expect(wordlist1).to be_invalid
    end
  end
end