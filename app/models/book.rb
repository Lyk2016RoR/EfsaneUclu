class Book < ApplicationRecord

	validates :name, presence: true
	validates :topic, presence: true
	validate :check_date

	belongs_to :category

	has_many :votes

	def average_rating
		votes.average(:rating).to_s
	end

  def check_date
    if year.present? && year > Date.today
        errors.add(:year, "date cannot be future")
      end
  end
end
