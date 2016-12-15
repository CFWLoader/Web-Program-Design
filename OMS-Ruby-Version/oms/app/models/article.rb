class Article < ApplicationRecord

	# http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: { minimum: 5 }
end
