require 'rails_helper'

RSpec.describe Word, type: :model do
  let(:user){ create(:user) }

  before do
    login_as user
  end
  it 'is success with valid word' do
    word = user.wordlists.words.build(
      word: "apple",
      parts_of_speech: "名詞",
      meaning: "りんご",
      example: "I ate apple."
    )
    expect(word).to be_valid
  end
end
