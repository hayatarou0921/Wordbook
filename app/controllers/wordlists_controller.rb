class WordlistsController < ApplicationController
  def index
    @wordlists = Wordlist.order(:created_at)
  end

  def new
    @wordlist = Wordlist.new
  end

  def create 
    @wordlist = Wordlist.new(wordlist_params)
    @wordlist.user_id = current_user.id
    if @wordlist.save
      redirect_to wordlists_path, notice: "単語帳「#{@wordlist.title}」を作成しました。"
    end
  end

  def edit
    @wordlist = Wordlist.find(params[:id])
  end

  def update
    @wordlist = Wordlist.find(params[:id])
    @wordlist.assign_attributes(wordlist_params)
    if @wordlist.save
      redirect_to wordlists_path, notice: 'タイトルを変更しました。'
    end
  end

  def destroy
    @wordlist = Wordlist.find(params[:id])
    if @wordlist.destroy
      redirect_to wordlists_path, notice: "単語帳「#{@wordlist.title}」を削除しました。"
    end
  end

  private
    def wordlist_params
      params.require(:wordlist).permit(:title)
    end
end
