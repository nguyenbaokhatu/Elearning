class LessonsController < ApplicationController
  before_action :single_lesson, only: [:create]

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @category = Category.find(@lesson.category_id)
  end

  private

  def lesson_params
    params.permit(:category_id).merge(user_id: current_user.id)
  end

  def single_lesson
    category = Category.find(params[:category_id])
    lesson = category.lessons.find_by(category_id: category, user_id: current_user)
    unless lesson.nil?
      lesson.destroy
    end
  end
end
