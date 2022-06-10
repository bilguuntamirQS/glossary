# app/models/word_category.rb
class WordCategory < ApplicationRecord
  belongs_to :word
  belongs_to :category
end
