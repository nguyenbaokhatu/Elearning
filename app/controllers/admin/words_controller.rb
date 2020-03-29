class Admin::WordsController <ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @word = @category.words
  end

  def new
    category = Category.find(params[:category_id])
    @word = category.words.build
    3.times {
      @word.word_answers.build
    }
  end

  def create
    category = Category.find(params[:category_id])
    @word = category.words.build(word_params)
    if @word.save
      flash[:success] = 'Create word successfully'
      redirect_to admin_category_words_url
    else
      flash[:alert] = 'Create word failed'
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
    3.times {
      @word.word_answers
    }
  end

  def update
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
    if @word.update(word_params)
      flash[:notice] = "Successfully updated Word"
      redirect_to admin_category_words_url
    else
      render 'edit'
    end
  end

  def destroy
    category = Category.find(params[:category_id])
    word = category.words.find(params[:id])
    word.destroy
    flash[:notice] = 'Word deleted.'
    redirect_to admin_category_words_url
  end


  private

  def word_params
    params.require(:word).permit(:content, word_answers_attributes: [:id, :content, :correct])
  end
end
