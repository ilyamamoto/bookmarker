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

	#after_initialize :register,
	#	if: Proc.new { |webpage| !webpage.url.nil? }

	@@natto = Natto::MeCab.new
	@@tfidf = TfIdf::Ja.new

	def register
		if fetched?
			get_content
			save
		end
	end

	def analyze
		if fetched?
			analyze_morpheme
			set_keywords
			analyze_tfidf
			analyze_kakariuke
			save_keywords_and_relationships
		end
	end

	private

		def fetched?
			fetch if @fetched.nil?
			@fetched
		end

		def fetch
			@html_raw = open(self.url).read
			self.html = URI.escape(@html_raw)
			@fetched = true
		rescue SocketError => e 
			@html_raw = self.html = e.inspect 
			@fetched = false
		end
		
		def get_title # deprecated: covered by #get_content
			@domtree = Nokogiri::HTML(@html_raw)
			self.title = @domtree.xpath('//title').text
		end

		def get_content
			content, title = ExtractContent.analyse(@html_raw)
			self.content = content 
			self.title ||= title
		end

		def analyze_morpheme
			@morphemes = @@natto.parse_as_nodes(self.content)
		end
		
		def set_keywords
			@words = @morphemes.map{ |n| n.surface }.uniq
		end

		def analyze_tfidf
			t = @@tfidf.tfidf( @morphemes.map{ |n| n.surface } )
			@words = @words.map{ |w| { surface: w, tfidf: t[w] } }
		end

		def analyze_kakariuke
		end

		def score_keyword(tfidf)
			# tentatively: score(significance) is equal to tfidf score
			tfidf
		end

		def save_keywords_and_relationships
			@words.each do |w|
				next if w[:surface].blank?
				keyword = save_keyword(w[:surface])
				save_relationship(keyword, score_keyword(w[:tfidf]))
			end
		end

		def save_keyword(name)
			Keyword.find_by!(name: name)
		rescue ActiveRecord::RecordNotFound
			Keyword.create!(name: name)
		end

		def save_relationship(keyword, significance)
			Relationship.create(
				webpage_id: self.id,
				keyword_id: keyword.id,
				significance: significance
			)
		rescue ActiveRecord::RecordNotUnique
			# the case relationship b/w self and keyword already established
		end

		def url_should_be_valid
			if !URI.parse(url).kind_of?(URI::HTTP)
				errors.add(:url, "is invalid")
			end
		end

end
