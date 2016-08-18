class Book < ApplicationRecord

	validates :name, presence: true
	validates :topic, presence: true
	validate :check_date
	belongs_to :publisher
	belongs_to :category

	has_many :comments, dependent: :destroy

  def check_date
    if year.present? && year > Date.today
        errors.add(:year, "date cannot be future")
      end
  end
end
