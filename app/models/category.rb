# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :words
  has_many :lessons, dependent: :destroy
  
  validates :name, presence: true
end
