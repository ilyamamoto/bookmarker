class WebpagesController < ApplicationController

	def new
		@webpage = Webpage.new
	end

	def create
		@webpage = Webpage.new(webpage_params)	
		if @webpage.register
			flash[:success] = 'Webpage Added!'
			redirect_to webpages_path
		else
			flash[:error] = 'Invalid URL' 
			render 'new'
		end
	end

	def index
		@webpages = Webpage.select(:id, :url, :title, :created_at)
			.order(created_at: :desc)
			.paginate(page: params[:page], per_page: 10)
	end

	def show
		@webpage = Webpage.find(params[:id])	
	end

	def destroy
		Webpage.find(params[:id]).destroy
		flash[:success] = "Webpage Deleted."
		redirect_to webpages_url
	end

	private
		
		def webpage_params
			params.require(:webpage).permit(:url)
		end
end
