require 'rails_helper'

RSpec.describe "Wordlists", type: :request do
  let(:user){ create(:user) }
  let(:wordlist){ create(:wordlist) }
  let(:apple){ create(:apple) }

  before do
    login_as user
  end

  describe "GET #index" do
    it "responds successful http status" do
      get wordlists_path
      expect(response.status).to eq 200
    end
  end
  describe "GET #new" do
    it "responds successful http status" do
      get new_wordlist_path
      expect(response.status).to eq 200
    end
  end
  describe "GET #edit" do
    it "responds successful http status" do
      get edit_wordlist_path(wordlist.id)
      expect(response.status).to eq 200
    end
  end
  describe "POST #create" do
    context 'parameter is valid' do
      it 'responds successful http status' do
        post wordlists_path, params: { wordlist: attributes_for(:wordlist) }
        expect(response.status).to eq 302
      end

      it "successfully generates a wordlist" do
        expect do
          post wordlists_path, params: { wordlist: attributes_for(:wordlist) }
        end.to change(Wordlist, :count).by(1)
      end
  
      it 'redirects to wordlists_path after creating wordlist' do
        post wordlists_path, params: { wordlist: attributes_for(:wordlist) }
        expect(response.status).to redirect_to wordlists_path
      end
    end
    context 'parameter is invalid' do
      it 'responds successful http status' do
        post wordlists_path, params: { wordlist: attributes_for(:wordlist, :invalid) }
        expect(response.status).to eq 200
      end

      it "doesn't generate a wordlist" do
        expect do
          post wordlists_path, params: { wordlist: attributes_for(:wordlist, :invalid) }
        end.not_to change(Wordlist, :count)
      end

      it 'has error messages with invalid parameters' do
        post wordlists_path, params: { wordlist: attributes_for(:wordlist, :invalid) }
        expect(response.body).to include "を入力してください"
      end
    end
  end

  describe "PATCH #update" do
      let!(:wordlist){ create(:wordlist) }
      let(:new_title) do 
        { title: 'Banana' }
      end

    context 'parameter is valid' do
      it 'responds successful http status' do
        patch wordlist_path(wordlist.id), params: { wordlist: {id: wordlist.id, title: new_title} }
        expect(response.status).to eq 302
      end

      it "successfully edits a wordlist" do
        expect do
          patch wordlist_path(wordlist.id), params: { wordlist: {id: wordlist.id, title: new_title} }
        end.to change(Wordlist, :count).by(0)
      end
  
      it 'redirects to wordlists_path after editing wordlist' do
        patch wordlist_path(wordlist.id), params: { wordlist: {id: wordlist.id, title: new_title} }
        expect(response.status).to redirect_to wordlists_path
      end
    end

    context 'parameter is invalid' do
      it 'responds successful http status' do
        patch wordlist_path(wordlist.id), params: { wordlist: {id: wordlist.id, title: new_title} }
        expect(response.status).to eq 302
      end

      it "doesn't edit a wordlist" do
        expect do
          patch wordlist_path(wordlist.id), params: { wordlist: {id: wordlist.id, title: ''} }
        end.not_to change(Wordlist, :count)
      end

      it 'has error messages with invalid parameters' do
        patch wordlist_path(wordlist.id), params: { wordlist: {id: wordlist.id, title: ''} }
        expect(response.body).to include "を入力してください"
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:wordlist){ create(:wordlist) }

    it 'responds successful http status' do
      delete wordlist_path(wordlist)
      expect(response.status).to eq 302
    end

    it 'deletes a wordlist' do
      expect do
        delete wordlist_path(wordlist)
      end.to change(Wordlist, :count).by(-1)
    end

    it 'redirects to wordlists_path after destroy action' do
      delete wordlist_path(wordlist)
      expect(response).to redirect_to(wordlists_url)
    end
  end
end
