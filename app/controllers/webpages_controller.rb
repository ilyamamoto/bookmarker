class WebpagesController < ApplicationController
	def index
		@webpages = Webpage.all
	end

	def new
		@webpage = Webpage.new
	end

	def show
		@webpage = Webpage.find(params[:id])	
	end

	def create
		
	end

	def destroy

	end
end
