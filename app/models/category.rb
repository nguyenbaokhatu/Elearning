# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :words
  has_many :lessons, dependent: :destroy
  has_many :users, through: :lessons
  has_many :lesson_words, through: :lessons

  validates :name, presence: true
end
