class WordlistsController < ApplicationController
  def index
    @wordlists = Wordlist.all
  end

  def new
    @wordlist = Wordlist.new
  end

  def create 
    @wordlist = Wordlist.new(wordlist_params)
    @wordlist.user_id = current_user.id
    if @wordlist.save
      redirect_to wordlists_path, notice: '単語帳を作成しました。'
    end
  end

  def show
    @wordlist = Wordlist.find(params[:id])
  end

  def edit
    @wordlist = Wordlist.find(params[:id])
  end

  private
    def wordlist_params
      params.require(:wordlist).permit(:name)
    end
end
