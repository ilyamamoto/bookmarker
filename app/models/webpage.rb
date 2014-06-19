require 'open-uri'
require 'nokogiri'
#require 'bundler/setup'
#require 'extractcontent'

class Webpage < ActiveRecord::Base
	has_many :relationships, dependent: :destroy
	has_many :keywords, through: :relationships

	validates :url, presence: true
	validate :url_should_be_valid

	after_initialize :fill_from_url,
		if: Proc.new { |webpage| !webpage.url.nil? }

	def fill_from_url
		self.fetch
				.get_title
				.get_content
				.analyze_morphene
				.analyze_kakariuke
	end

	def fetch
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
		self.content = self.html # tentative, for extractcontent seems not available
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
			if !URI.parse(url).kind_of?(URI::HTTP)
				errors.add(:url, "is invalid")
			end
		end

end
