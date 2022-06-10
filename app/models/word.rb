# app/models/word.rb
class Word < ApplicationRecord
  belongs_to :user
  has_many :word_categories
  accepts_nested_attributes_for :word_categories
end
