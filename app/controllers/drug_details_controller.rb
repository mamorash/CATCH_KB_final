class DrugDetailsController < ApplicationController

	def index
		@drug_details = Drug_detail.all
	end
	
	def search
		@search_results = Drug_detail.search(params[:search_keywords])
	end
	
	def create
		@drug_detail = Drug_detail.new(params.require(:drug_detail).permit(:drug_name, :RxNorm_CUI, :pharm_link, :SIDER_link))
		
		@drug_details = Drug_detail.all
		
		@drug_details.each do |d|
			if @drug_detail.RxNorm_CUI == d.RxNorm_CUI
				return
			end
		end
		
		if @drug_detail.save
			redirect_to ad_index_path
		else
			render "new"
		end
	end
	
	def update
		@drug_detail = Drug_detail.find(params[:id])
		if @drug_detail.update_attributes(drug_params)
			redirect_to ad_index_path
		end
	end
	
	def rxnorm
		
	end
	
	private
	
		def drug_params
			params.require(:drug_detail).permit(:drug_name, :RxNorm_CUI, :pharm_link, :SIDER_link)
		end
end
