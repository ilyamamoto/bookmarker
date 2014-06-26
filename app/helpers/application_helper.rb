module ApplicationHelper

	def webpage_new
		@webpage_new = Webpage.new
	end

	def keyword_show
		@keyword_show = Keyword.new
	end

	def is_active?(name)
		controller_name == name
	end
end
