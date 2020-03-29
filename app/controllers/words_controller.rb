# frozen_string_literal: true
# Description/Explanation of WelcomeController class

class WordsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @categories = current_user.categories
    if params[:filter].present?
      category = Category.find(params[:filter])
      @lesson_words = category.lesson_words.page(params[:page]).per(6).order(created_at: :desc)
    else
      @lesson_words = @user.lesson_words.page(params[:page]).per(6).order(created_at: :desc)
    end
  end
end
