class AdminDrugController < ApplicationController

	def index
		@drug_details = Drug_detail.all
	end
	
	def new
		@drug_detail = Drug_detail.new
	end
	
	def edit
		@drug_detail=Drug_detail.find(params[:query])
	end
	
	def update
		@drug_detail = Drug_detail.find(params[:query])
		if @Drug_detail.update_attirubutes(params[:drug_detail])
			redirect_to ad_index_path
		end
	end
	
	def show
	end
	
	def destroy
		@drug_detail = Drug_detail.find(params[:query])
		@drug_detail.destroy
		redirect_to ad_index_path
	end
	
end