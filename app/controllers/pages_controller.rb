class PagesController < ApplicationController
	def index
		@pages = Page.all
	end

	def new

	end
end
