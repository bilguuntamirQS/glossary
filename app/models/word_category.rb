# app/models/word_category.rb
class WordCategory < ApplicationRecord
  belongs_to :word
  belongs_to :category
  accepts_nested_attributes_for :word
end
