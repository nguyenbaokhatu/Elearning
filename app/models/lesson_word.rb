# frozen_string_literal: true

class LessonWord < ApplicationRecord
  belongs_to :word
  belongs_to :lesson
  belongs_to :choice
  has_many :users, through: :lessons
  has_many :categories, through: :lessons

  accepts_nested_attributes_for :words

  validates :word_id, presence: true
  validates :lesson_id, presence: true
  validates :choice_id, presence: true

  def correct_word_answer
    word_answers.find_by(correct: true)
  end
end
