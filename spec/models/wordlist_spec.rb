require 'rails_helper'

RSpec.describe Wordlist, type: :model do
  let(:wordlist){ create(:wordlist) }
  
  it 'is valid with name' do
    expect(wordlist).to be_valid
  end

  it 'is invalid without name' do
    invalid = build(:wordlist, name: nil)
    expect(invalid).to be_invalid
  end
end
