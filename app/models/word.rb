# frozen_string_literal: true

class Word < ApplicationRecord
  belongs_to :category
  has_many :lessons, through: :lesson_words
  has_many :word_answers, dependent: :destroy
  accepts_nested_attributes_for :word_answers

  validates :content,presence: true, length: { maximum: 20 }
  validates :category_id, presence: true
end
