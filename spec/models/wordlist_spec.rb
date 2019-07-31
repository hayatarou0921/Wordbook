require 'rails_helper'

RSpec.describe User, type: :model do
  let(:wordlist){ create(:wordlist) }

  it 'is valid with title' do
    expect(wordlist).to be_valid
  end
end