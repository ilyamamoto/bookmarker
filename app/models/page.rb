class Page < ActiveRecord::Base
	validates :url, presence: true

	# fetch page html source
	def fetch
		
	end

	# dissect html content to collection of statements
	def dissect

	end
end
