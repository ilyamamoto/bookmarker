FactoryGirl.define do

	factory :webpage_only_with_url, class: Webpage do
		url	"http://example.com"
		#title ""
		#content ""
	end

	factory :webpage do
		url "http://example.com"
		title "Example Domain"
		content "\n\n    Example Domain\n    This domain is established to be used for illustrative examples in documents. You may use this\n    domain in examples without prior coordination or asking for permission.\n    More information...\n"
	end

	factory :keyword do
		name "example"
	end

end
