class Post < ApplicationRecord
	belongs_to :category
	belongs_to :user
	has_many :comments
	has_attached_file :image, :default_url => ":style/post.jpg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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

	def self.search(query)
		where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
	end



end
