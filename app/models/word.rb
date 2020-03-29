# frozen_string_literal: true

class Word < ApplicationRecord
  belongs_to :category
  has_many :lessons, through: :lesson_word
  has_many :word_answers, dependent: :destroy
  accepts_nested_attributes_for :word_answers

  validates :content,presence: true, length: { maximum: 20 }
  validates :category_id, presence: true
  validate :check_word_answer
end
