class Vote < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :rating, inclusion: (1..5)
  validates :book_id, uniqueness: {scope: :book_id}
end
