# frozen_string_literal: true

class WordAnswer < ApplicationRecord
  belongs_to :word
  has_many :lessons, through: :lesson_word

  validates :content, presence: true, length: { maximum: 20 }
end
