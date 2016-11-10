class Post < ApplicationRecord
	belongs_to :category
	belongs_to :user
	has_many :comments

	# Validation
	validates :title, presence: true,
			length:{
				minimum: 2,
				maximum: 250
			}
	validates :category, presence: true
	validates :tags, presence: true,
				length:{
					minimum: 2,
					maximum: 500
				}
	validates :body, presence: true,
				length:{
					minimum: 20
				}

end
