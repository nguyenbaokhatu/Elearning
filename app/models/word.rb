# frozen_string_literal: true

class Word < ApplicationRecord
  belongs_to :category
  has_many :lessons, through: :lesson_word
  has_many :word_answers, dependent: :destroy
  accepts_nested_attributes_for :word_answers

  validates :content,presence: true, length: { maximum: 20 }
  validates :category_id, presence: true
  validate :check_word_answer

  def correct_word_answer
    word_answers.find_by(correct: true)
  end

  private

  def check_word_answer
    word_answer = word_answers.collect { |c| c.correct || nil }.compact
    if word_answer.size == 0
      errors.add(:word_answers_correct, "can't be blank")
    elsif word_answer.size > 1
      errors.add(:word_answers_correct, "can have only one word answer")
    end
  end
end
