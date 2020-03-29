class LessonWordsController < ApplicationController
  def new
    @lesson = Lesson.find(params[:lesson_id])
    @category = Category.find_by(id: @lesson.category_id)
    #if all word has been answered, redirect to lesson show
    if @lesson.next_word.nil?
      @lesson.update(result: @lesson.lesson_results)
      @lesson.create_activity(user: current_user)
      redirect_to lesson_url(@lesson.id)
    end
  end

  def create
    lesson = Lesson.find(params[:lesson_id])
    @answer = lesson.answers.build(answer_params)
    if @answer.save
      redirect_to new_lesson_answer_url(lesson)
    else
      render 'new'
    end
  end

  private

  def lesson_word_params
    params.require(:answer).permit(:word_id, :word_answers_id, :lesson_id)
  end
end
