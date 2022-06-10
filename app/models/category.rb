class Category < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user

  validates :category_name, :presence => true
end
