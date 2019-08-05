class WordsController < ApplicationController
  def index
    #wordをwordlistと紐づけるため、paramのidから取得
    @wordlist = Wordlist.find(params[:wordlist_id])
    #検索結果から絞りこみ
    @search_q = Word.where(wordlist_id: params[:wordlist_id]).order(:created_at).ransack(params[:q], search_key: :search_q)
    @words = @search_q.result(distinct: true).page(params[:page]).per(10)
    #品詞選択から絞りこみ
    @refine_q = Word.where(wordlist_id: params[:wordlist_id]).order(:created_at).ransack(params[:q], search_key: :refine_q)
    @words = @refine_q.result(distinct: true).page(params[:page]).per(10)
  end

  def new
    @word = Word.new
    @wordlist = Wordlist.find(params[:wordlist_id])
  end

  def create
    @word = Word.new(word_params)
    @word.wordlist_id = params[:wordlist_id]
    if @word.save
      redirect_to wordlist_words_path(params[:wordlist_id]), notice: "「#{@word.word}」を追加しました。"
    else
      render :new
    end
  end

  def edit
    @word = Word.find(params[:id])
    @number = @word.wordlist_id
  end

  def update
    @word = Word.find(params[:id])
    @word.assign_attributes(word_params)
    @wordlist_id = @word.wordlist_id
    if @word.save
      redirect_to wordlist_words_path(@wordlist_id), notice: "「#{@word.word}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @wordlist_id = @word.wordlist_id
    if @word.destroy
      redirect_to wordlist_words_path(@wordlist_id), notice: "「#{@word.word}」を削除しました。"
    end
  end

  private
    def word_params
      params.require(:word).permit(:word, :parts_of_speech, :meaning, :example, :wordlist_id)
    end
end
