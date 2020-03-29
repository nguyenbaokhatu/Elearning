# frozen_string_literal: true

class LessonWord < ApplicationRecord
  belongs_to :word
  belongs_to :lesson
  belongs_to :word_answer
  has_many :users, through: :lessons
  has_many :categories, through: :lessons

  validates :word_id, presence: true
  validates :lesson_id, presence: true
  validates :word_answer_id, presence: true

  def correct_word_answer
    word_answers.find_by(correct: true)
  end
end
