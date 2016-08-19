class Book < ApplicationRecord

	validates :name, presence: true
	validates :topic, presence: true
	validate :check_date
	belongs_to :publisher
	belongs_to :category


	has_many :votes

	def average_rating
		votes.average(:rating).to_s
	end

	has_many :comments, dependent: :destroy
	has_and_belongs_to_many :authors


  def check_date
    if year.present? && year > Date.today
        errors.add(:year, "date cannot be future")
      end
  end
end
