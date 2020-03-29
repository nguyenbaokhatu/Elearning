# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_many :lesson_words
  has_many :words, through: :lesson_words
  has_many :word_answers, through: :lesson_words

  validates :user_id, presence: true
  validates :category_id, presence: true

  def next_word
    (category.words - words).first
  end

  def lesson_results
    word_answers.where(correct: true).count
  end

  def learned_words
    word_answers.where(correct: true)
  end

  def lesson_activity(current_user)
    activities.create(activity_id: id, activity_type: "Lesson", user_id: current_user.id)
  end
end
