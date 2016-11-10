class Category < ApplicationRecord
	has_many :posts
	validates :name, presence: true,
		length:{
			minimum: 3,
			maximum: 250
		}
	def self.search(query)
		where("name like ?", "%#{query}%")
	end
end
