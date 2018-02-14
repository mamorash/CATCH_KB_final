class AdminFindController < ApplicationController

	def index
		@findings = Finding.all
	end
	
	def new
		@finding = Finding.new
	end
	
	def edit
		@finding=Finding.internal_search(params[:query],params[:type])
	end
	
	#not used
	def update
		@finding = Finding.find(params[:query])
		if @finding.update_attirubutes(params[:finding])
			redirect_to af_index_path
		end
	end
	
	def show
	end
	
	def destroy
		@finding = Finding.find(params[:query])
		@finding.destroy
		redirect_to af_index_path
	end
	
end