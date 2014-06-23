namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_webpages
		#make_keywords
		#make_relationships
	end
end

def make_webpages
	100.times do |n|
		url = 'http://example.com/'
		w = Webpage.create!(url: url)
		w.analyze
	end
end

