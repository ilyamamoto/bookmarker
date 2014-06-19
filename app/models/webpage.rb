require 'open-uri'
require 'nokogiri'
#require 'bundler/setup'
#require 'extractcontent'

class Webpage < ActiveRecord::Base
	validates :url, presence: true
	validate  :url_should_be_valid

	#attr_accessor :html, :title, :content

	after_initialize do
		self
			.fetch
			.get_title
			.get_content
			.analyze_morphene
			.analyze_kakariuke
	end

	def fetch
	# fetch page html source
		@html_raw = open(self.url).read
		self.html = URI.escape(@html_raw)
		self
	end
	
	def get_title
		@domtree = Nokogiri::HTML(@html_raw)
		self.title = @domtree.xpath('//title').text
		self
	end

	def get_content
	# extract content
		self.content = "a"
		self
	end

	def analyze_morphene
		self
	end

	def analyze_kakariuke
		self
	end

	def get_keywords
		self
	end

	def score_keyword
		self
	end

	private

		def url_should_be_valid
			if url.nil? || !URI.parse(url).kind_of?(URI::HTTP)
				errors.add(:url, "is invalid")
			end
		end
end
