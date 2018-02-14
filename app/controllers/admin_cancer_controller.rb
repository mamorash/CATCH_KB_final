class AdminCancerController < ApplicationController

	def index
		@cancer_details = Cancer_detail.all
	end
	
	def new
		@cancer_detail = Cancer_detail.new
	end
	
	def edit
		@cancer_detail=Cancer_detail.find(params[:query])
	end
	
	def update
		@cancer_detail = Cancer_detail.find(params[:id])
		if @cancer_detail.update_attributes(params[:cancer_detail])
			redirect_to ac_index_path
		end
	end
	
	def show
	end
	
	def destroy
		@cancer_detail = Cancer_detail.find(params[:query])
		@cancer_detail.destroy
		redirect_to ac_index_path
	end
	
end