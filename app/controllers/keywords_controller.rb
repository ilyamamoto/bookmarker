class KeywordsController < ApplicationController

	def index
		@keywords = Keyword.all
	end
end
