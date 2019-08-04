require 'rails_helper'

RSpec.describe "Words", type: :request do
  let(:user){ create(:user) }
  let!(:wordlist){ create(:wordlist, id: 1) }
  let!(:word){ create(:word, wordlist_id: 1) }
  before do
    login_as user
  end
  describe "GET #index" do
    it "responds successful http status" do
      get wordlist_words_path(wordlist.id)
      expect(response).to have_http_status(200)
    end
    it "displays title of wordlist" do
      get wordlist_words_path(wordlist.id)
      expect(response.body).to include (wordlist.title)
    end
    it "displays word, meaning and example of word" do
      get wordlist_words_path(wordlist.id)
      expect(response.body).to include word.word, word.meaning, word.example
    end
  end

  describe 'GET #new' do
    it "responds successful http status" do
      get new_wordlist_word_path(wordlist.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it "responds successful http status" do
      get edit_word_path(word.id)
      expect(response).to have_http_status(200)
    end
    it "displays word" do
      get edit_word_path(word.id)
      expect(response.body).to include word.word
    end
    it "displays meaning" do
      get edit_word_path(word.id)
      expect(response.body).to include word.meaning
    end
    it "displays example" do
      get edit_word_path(word.id)
      expect(response.body).to include word.example
    end
  end

  describe 'POST #create' do
    context 'valid parameters' do
      it 'responds successful http status' do
        post wordlist_words_path(wordlist.id), params: { word: attributes_for(:word) }
        expect(response.status).to eq 302
      end
      it "successfully generates a word" do
        expect do
          post wordlist_words_path(wordlist.id), params: { word: attributes_for(:word) }
        end.to change(Word, :count).by(1)
      end
      it 'redirects to words_path after creating word' do
        post wordlist_words_path(wordlist.id), params: { word: attributes_for(:word) }
        expect(response.status).to redirect_to wordlist_words_path
      end
    end

    context 'invalid parameters' do
      it 'responds successful http status' do
        post wordlist_words_path(wordlist.id), params: { word: attributes_for(:word, word: nil) }
        expect(response.status).to eq 200
      end
      it "doesn't generate a word" do
        expect do
          post wordlist_words_path(wordlist.id), params: { word: attributes_for(:word, word: nil) }
        end.to change(Word, :count).by(0)
      end
      it 'has error messages without word' do
        post wordlist_words_path(wordlist.id), params: { word: attributes_for(:word, word: nil, meaning: nil) }
        expect(response.body).to include "単語を入力してください", "意味を入力してください"
      end
    end
  end

  describe 'PATCH #update' do
    context 'valid parameters' do
      it 'responds successful http status' do
        patch word_path(word.id), params: { word: attributes_for(:word) }
        expect(response.status).to eq 302
      end
      it 'updates word' do
        expect do
          patch word_path(word.id), params: { word: attributes_for(:word, word:'orange') }
        end.to change { Word.find(word.id).word }.from('apple').to('orange')
      end
      it 'updates meaning' do
        expect do
          patch word_path(word.id), params: { word: attributes_for(:word, meaning:'赤い果物') }
        end.to change { Word.find(word.id).meaning }.from('りんご').to('赤い果物')
      end
      it 'redirect to words_path after editing word' do
        patch word_path(word.id), params: { word: attributes_for(:word) }
        expect(response).to redirect_to wordlist_words_path(wordlist.id)
      end
    end

    context 'invalid parameters' do
      it 'responds successful http status' do
        patch word_path(word.id), params: { word: attributes_for(:word, word: nil) }
        expect(response.status).to eq 200
      end
      it 'doesn\'t update word' do
        expect do
          patch word_path(word.id), params: { word: attributes_for(:word, word:'') }
        end.not_to change(Word.find(word.id), :word)
      end
      it 'doesn\'t update meaning' do
        expect do
          patch word_path(word.id), params: { word: attributes_for(:word, meaning:'') }
        end.not_to change(Word.find(word.id), :meaning)
      end
      it 'renders error messages without word' do
        patch word_path(word.id), params: { word: attributes_for(:word, word:'') }
        expect(response.body).to include '単語を入力してください'
      end
      it 'renders error messages without meaning' do
        patch word_path(word.id), params: { word: attributes_for(:word, meaning:'') }
        expect(response.body).to include '意味を入力してください'
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'responds successful http status' do
      delete word_path(word.id)
      expect(response.status).to eq 302
    end
    it 'deletes a word' do
      expect do
        delete word_path(word.id)
      end.to change(Word, :count).by(-1)
    end
    it 'redorects to wordlist_words_path after delete' do
      delete word_path(word.id)
      expect(response).to redirect_to(wordlist_words_path(wordlist.id))
    end
  end
#   wordlist_words GET    /wordlists/:wordlist_id/words(.:format)     words#index
#                    POST   /wordlists/:wordlist_id/words(.:format)     words#create
#  new_wordlist_word GET    /wordlists/:wordlist_id/words/new(.:format) words#new
#          edit_word GET    /words/:id/edit(.:format)                   words#edit
#               word GET    /words/:id(.:format)                        words#show
#                    PATCH  /words/:id(.:format)                        words#update
#                    PUT    /words/:id(.:format)                        words#update
#                    DELETE /words/:id(.:format)                        words#destroy
end
