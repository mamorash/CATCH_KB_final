class AdminPaperController < ApplicationController

	def index
		@study_details = Paper.all
	end
	
	def new
		@paper = Paper.new
	end
	
	def edit
		@paper=Paper.find(params[:query])
	end
	
	def update
		@paper = Paper.find(params[:query])
		if @paper.update_attirubutes(params[:paper])
			redirect_to ap_index_path
		end
	end
	
	def show
	end
	
	def destroy
		@paper = Paper.find(params[:query])
		@paper.destroy
		redirect_to ap_index_path
	end
	
end