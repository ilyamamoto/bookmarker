require 'open-uri'
require 'nokogiri'
require 'bundler/setup'; require 'extractcontent'
require 'natto'
require 'tfidf_ja'
#require 'tf_idf'

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
				.analyze_morpheme
				.analyze_kakariuke
				.get_keywords
				.score_keywords
				.save
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
		content, title = ExtractContent.analyse(@html_raw)
		self.content = content 
		self.title ||= title
		self
	end

	def analyze_morpheme
		@morphemes = nil
		natto = Natto::MeCab.new
		@morphemes = natto.parse_as_nodes(self.content)
		p @morphemes
		self
	end
	
	def analyze_tfidf
		tfidf = TfIdf::Ja.new
		p tfidf.tfidf(@words)

		self
	end

	def analyze_kakariuke
		self
	end

	def get_keywords
		# @morphenes.each do |morphene|
		# 	name = morphene.surface
		# 	keyword = Keyword.new(name)
		# 	if keyword.save
		# 		relationship = Relationship.new(self.id, keyword.id)
		self
	end

	def score_keywords
		self
	end

	private

		def url_should_be_valid
			if !URI.parse(url).kind_of?(URI::HTTP)
				errors.add(:url, "is invalid")
			end
		end

end
