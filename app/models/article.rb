class Article < ApplicationRecord
	validates :name, presence: true, length: { minimum: 2, maximum: 112 }
	validates :title, presence: true, length: { minimum: 2, maximum: 112 }

	belongs_to :user
	has_many :article_categories
	has_many :categories, through: :article_categories

	
end
