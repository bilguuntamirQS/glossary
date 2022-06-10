class Translation < ApplicationRecord
  belongs_to :word
  belongs_to :category
  belongs_to :user
end
