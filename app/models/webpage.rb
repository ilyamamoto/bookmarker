require 'open-uri'
require 'nokogiri'
require 'bundler/setup'; require 'extractcontent'
require 'natto'
require 'tfidf_ja'

class Webpage < ActiveRecord::Base
	has_many :relationships, dependent: :destroy
	has_many :keywords, through: :relationships

	validates :url, presence: true
	validate :url_should_be_valid

	after_initialize :fill_from_url,
		if: Proc.new { |webpage| !webpage.url.nil? }

	@@natto = Natto::MeCab.new
	@@tfidf = TfIdf::Ja.new

	private
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
			@morphemes = @@natto.parse_as_nodes(self.content)
			self
		end
		
		def analyze_tfidf
			@@tfidf.tfidf(@words)
			self
		end

		def analyze_kakariuke
			self
		end

		def get_keywords
			self
		end

		def score_keywords
			self
		end

		def save_keywords
			@morphemes.each do |morpheme|
				Keyword.new(name: morpheme.surface).save
			end
				#if keyword.save
				#	relationship = Relationship.new(self.id, keyword.id)
		end

		def save_relationships
			self.keywords.each do |keyword|
				Relationship.new(self.id, keyword.id).save
			end
			self.relationships
		end

		def url_should_be_valid
			if !URI.parse(url).kind_of?(URI::HTTP)
				errors.add(:url, "is invalid")
			end
		end

end
