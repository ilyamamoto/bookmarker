class Webpage < ActiveRecord::Base
	validates :url, presence: true

	# fetch page html source
	def fetch
		
	end

	def get_content

	end

	def analyze_morphene

	end

	def analyze_kakariuke

	end

	def get_keywords

	end

	def score_keyword
	end


end
