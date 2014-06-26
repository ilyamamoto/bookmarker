class KeywordsController < ApplicationController

	def index
		#@webpage_new = Webpage.new
		#@keyword_show = Keyword.new
		@keywords = Keyword.limit(10)
	end

	def show
		@keyword = Keyword.find(params[:id])
	end
end
