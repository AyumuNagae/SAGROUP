class Comment < ApplicationRecord
  belongs_to  :user, :micropost


  validates   :content, presence: true
end
