require 'rails_helper'

RSpec.describe 'Wordlists', type: :system do
  let!(:user){ create(:user) }
  before do
    login_as user
    create(:wordlist)
  end

  it 'generates a new wordlist' do
    visit wordlists_path
    click_on '単語帳を作る'

    fill_in 'タイトル', with: '単語帳１'
    click_on '登録する'

    expect(page).to have_content '単語帳１'
  end

  it 'edits title' do
    visit wordlists_path
    click_on '名前を変更'

    fill_in 'タイトル', with: '単語帳X'
    click_on '更新する'

    expect(page).to have_content '単語帳X'
  end

  it "doesn't generate a new wordlist" do
    visit wordlists_path
    click_on '単語帳を作る'

    fill_in 'タイトル', with: ''
    click_on '登録する'

    expect(page).to have_text 'タイトルを入力してください'
  end

  it "doesn't edit title" do
    visit wordlists_path
    click_on '名前を変更'

    fill_in 'タイトル', with: ''
    click_on '更新する'

    expect(page).to have_text 'タイトルを入力してください'
  end
end