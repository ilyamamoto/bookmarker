class WebpagesController < ApplicationController
	def index
		@pages = Page.all
	end

	def new
		@page = Page.new

	end

	def create
		
	end

	def destroy

	end
end
