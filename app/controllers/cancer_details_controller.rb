class CancerDetailsController < ApplicationController

	def index
		@cancer_details = Cancer_detail.all
	end
	
	def search
		@search_results = Cancer_detail.search(params[:search_keywords])
	end
	
	
	def create
		#NEED TO UPDATE PARAMS TO BE PAPER PARAMS
		@cancer_detail = Cancer_detail.new(params.require(:cancer_detail).permit(:cancer_name, :SNOMED_SCTID))
		
		@cancer_details = Cancer_detail.all
		
		@cancer_details.each do |c|
			if @cancer_detail.cancer_name == c.cancer_name
				return
			end
		end
		
		if @cancer_detail.save
			redirect_to ac_index_path
		else
			render "new"
		end
	end
	
	def update
		@cancer_detail = Cancer_detail.find(params[:id])
		if @cancer_detail.update_attributes(cancer_params)
			redirect_to ac_index_path
		end
		
	end
	
	private
	#NEED TO UPDATE PARAMS TO BE PAPER FIELDS
		def cancer_params
			
			params.require(:cancer_detail).permit(:cancer_name, :SNOMED_SCTID)
			
			#params.require(:gene).permit(:gene_name, :variant_list, :family_name_1, :family_id_1, :family_name_2, :family_id_2, :family_name_3, :family_id_3,:family_name_4, :family_id_4, :kegg_link, :gwas_link, :pharm_link)
		end
end