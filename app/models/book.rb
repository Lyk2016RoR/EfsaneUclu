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


	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
 validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
