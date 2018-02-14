class AdminGeneController < ApplicationController

	def index
		@genes = Gene.all
	end
	
	def new
		@gene = Gene.new
	end
	
	def edit
		@gene=Gene.find(params[:query])
	end
	
	def update
		@gene = Gene.find(params[:query])
		if @gene.update_attirubutes(params[:gene])
			redirect_to ag_index_path
		end
	end
	
	def show
	end
	
	def destroy
		@gene = Gene.find(params[:query])
		@gene.destroy
		redirect_to ag_index_path
	end
	
end