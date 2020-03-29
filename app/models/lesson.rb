# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_many :lesson_words
  has_many :words, through: :lesson_words
  has_many :word_answers, through: :lesson_words

  validates :user_id, presence: true
  validates :category_id, presence: true
end
