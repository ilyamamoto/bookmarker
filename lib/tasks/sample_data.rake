namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_webpages
		#make_keywords
		#make_relationships
	end
end

def make_webpages
	30.times do |n|
		url = "http://ja.wikipedia.org/wiki/#{n}"
		p url
		w = Webpage.new(url: url)
		w.register
		w.analyze
	end
end

