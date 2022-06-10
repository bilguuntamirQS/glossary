class User < ApplicationRecord
  validates :user_name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true

  enum permission: ["system admin", "editor", "commentor"]
end
