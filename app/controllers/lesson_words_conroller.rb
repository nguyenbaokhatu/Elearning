class LessonWordsController < ApplicationController
  def new
    @lesson = Lesson.find(params[:lesson_id])
    @category = Category.find_by(id: @lesson.category_id)
    #if all word has been answered, redirect to lesson show
    if @lesson.next_word.nil?
      @lesson.update(result: @lesson.results)
      @lesson.create_activity(user: current_user)
      redirect_to lesson_url(@lesson.id)
    end
  end

  def create
    lesson = Lesson.find(params[:lesson_id])
    @lesson_word = lesson.lesson_words.build(answer_params)
    if @lesson_word.save
      redirect_to new_lesson_lesson_word_url(lesson)
    else
      render 'new'
    end
  end

  private

  def lesson_word_params
    params.require(:answer).permit(:word_id, :word_answers_id, :lesson_id)
  end
end
