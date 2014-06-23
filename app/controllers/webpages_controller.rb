class WebpagesController < ApplicationController

	def new
		@webpage = Webpage.new
	end

	def create
		@webpage = Webpage.new(webpage_params)	
		if @webpage.save
			flash[:success] = 'Webpage Added!'
			render 'index'
		else
			render 'new'
		end
	end

	def index
		@webpage_new = Webpage.new
		@keyword_show = Keyword.new
		@webpages = Webpage.select(:id, :url, :title, :created_at)
		.paginate(page: params[:page], per_page: 10)
	end

	def show
		@webpage = Webpage.find(params[:id])	
	end

	def destroy

	end

	private
		
		def webpage_params
			params.require(:webpage).permit(:url)
		end
end
