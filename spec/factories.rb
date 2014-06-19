FactoryGirl.define do
	factory :webpage_only_with_url, class: Webpage do
		url	"http://example.com"
		html ""
		title ""
		content ""
	end
	factory :webpage do
		url "http://example.com"
		title "Example Domain"
		html "%3C!doctype%20html%3E%0A%3Chtml%3E%0A%3Chead%3E%0A%20%20%20%20%3Ctitle%3EExample%20Domain%3C/title%3E%0A%0A%20%20%20%20%3Cmeta%20charset=%22utf-8%22%20/%3E%0A%20%20%20%20%3Cmeta%20http-equiv=%22Content-type%22%20content=%22text/html;%20charset=utf-8%22%20/%3E%0A%20%20%20%20%3Cmeta%20name=%22viewport%22%20content=%22width=device-width,%20initial-scale=1%22%20/%3E%0A%20%20%20%20%3Cstyle%20type=%22text/css%22%3E%0A%20%20%20%20body%20%7B%0A%20%20%20%20%20%20%20%20background-color:%20%23f0f0f2;%0A%20%20%20%20%20%20%20%20margin:%200;%0A%20%20%20%20%20%20%20%20padding:%200;%0A%20%20%20%20%20%20%20%20font-family:%20%22Open%20Sans%22,%20%22Helvetica%20Neue%22,%20Helvetica,%20Arial,%20sans-serif;%0A%20%20%20%20%20%20%20%20%0A%20%20%20%20%7D%0A%20%20%20%20div%20%7B%0A%20%20%20%20%20%20%20%20width:%20600px;%0A%20%20%20%20%20%20%20%20margin:%205em%20auto;%0A%20%20%20%20%20%20%20%20padding:%2050px;%0A%20%20%20%20%20%20%20%20background-color:%20%23fff;%0A%20%20%20%20%20%20%20%20border-radius:%201em;%0A%20%20%20%20%7D%0A%20%20%20%20a:link,%20a:visited%20%7B%0A%20%20%20%20%20%20%20%20color:%20%2338488f;%0A%20%20%20%20%20%20%20%20text-decoration:%20none;%0A%20%20%20%20%7D%0A%20%20%20%20@media%20(max-width:%20700px)%20%7B%0A%20%20%20%20%20%20%20%20body%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20background-color:%20%23fff;%0A%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%20%20div%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20width:%20auto;%0A%20%20%20%20%20%20%20%20%20%20%20%20margin:%200%20auto;%0A%20%20%20%20%20%20%20%20%20%20%20%20border-radius:%200;%0A%20%20%20%20%20%20%20%20%20%20%20%20padding:%201em;%0A%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%7D%0A%20%20%20%20%3C/style%3E%20%20%20%20%0A%3C/head%3E%0A%0A%3Cbody%3E%0A%3Cdiv%3E%0A%20%20%20%20%3Ch1%3EExample%20Domain%3C/h1%3E%0A%20%20%20%20%3Cp%3EThis%20domain%20is%20established%20to%20be%20used%20for%20illustrative%20examples%20in%20documents.%20You%20may%20use%20this%0A%20%20%20%20domain%20in%20examples%20without%20prior%20coordination%20or%20asking%20for%20permission.%3C/p%3E%0A%20%20%20%20%3Cp%3E%3Ca%20href=%22http://www.iana.org/domains/example%22%3EMore%20information...%3C/a%3E%3C/p%3E%0A%3C/div%3E%0A%3C/body%3E%0A%3C/html%3E%0A"
		content "\n\n    Example Domain\n    This domain is established to be used for illustrative examples in documents. You may use this\n    domain in examples without prior coordination or asking for permission.\n    More information...\n"
	end

end
