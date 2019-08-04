require 'rails_helper'

RSpec.describe 'Words', type: :system do
  let!(:user){ create(:user) }
  let!(:wordlist){ create(:wordlist) }
  before do
    login_as user
    create(:banana, wordlist_id: wordlist.id)
  end

  it 'successfully generates a word' do
    visit wordlist_words_path(wordlist.id)
    click_on '単語を追加する'
    
    fill_in '単語', with: 'apple'
    select '名詞', from: '品詞'
    fill_in '意味', with: 'りんご'
    fill_in '例文', with: 'Apple is red fruits.'
    click_on '登録する'

    expect(page).to have_content('apple')
    expect(page).to have_content('(名)')
    expect(page).to have_content('りんご')
    expect(page).to have_content('Apple is red fruits.')
  end

  it 'edits word' do
    visit wordlist_words_path(wordlist.id)
    click_on 'banana'

    fill_in '単語', with: 'run'
    select '動詞', from: '品詞'
    fill_in '意味', with: '走る'
    fill_in '例文', with: 'I run 10km everyday.'
    click_on '更新する'

    expect(page).to have_content('run')
    expect(page).to have_content('(動)')
    expect(page).to have_content('走る')
    expect(page).to have_content('I run 10km everyday.')
  end
end