class GenesController < ApplicationController

	def index
		@genes = Gene.all
	end
	
	def search
		@search_results = Finding.search(params[:search_keywords])
		@search_term = params[:search_keywords]
	end
	
	def mo_search
		@search_results = Mo_paper.search(params[:mo_search_keywords])
		@search_term = params[:mo_search_keywords]
	end
	
	def internal_search
		@search_results = Finding.search(params[:query])
		@search_term = params[:query]
	end
	
	def gene_detail 
		@genes = Finding.search(params[:query])
		@gene_details = Gene.search(@genes)
		@search_term = params[:query]
	end
	
	def study_detail
		@papers = Finding.search(params[:query])
		@study_details = Paper.search(@papers)
		@search_term = params[:query]
	end
	
	def drug_detail
		@papers = Finding.search(params[:query])
		@study_details = Paper.search(@papers)
		@drug_details = Drug_detail.search(@study_details)
		@search_term = params[:query]
	end
	
	def cancer_detail
		@papers = Finding.search(params[:query])
		@study_details = Paper.search(@papers)
		@cancer_details = Cancer_detail.search(@study_details)
		@search_term = params[:query]
	end
	
	def create
		@gene = Gene.new(params.require(:gene).permit(:gene_name, :variant_list, :KEGG_link, :GWAS_link, :pharm_link))
		
		@genes = Gene.all
		
		@genes.each do |g|
			if @gene.gene_name == g.gene_name
				return
			end
		end
		
		if @gene.save
			redirect_to ag_index_path
		else
			render "new"
		end
	end
	
	def update
		@gene = Gene.find(params[:id])
		if @gene.update_attributes(gene_params)
			redirect_to ag_index_path
		end
	end
	
	def rxnorm
		
	end
	
	private
	
		def gene_params
			params.require(:gene).permit(:gene_name, :variant_list, :family_name_1, :family_id_1, :family_name_2, :family_id_2, :family_name_3, :family_id_3,:family_name_4, :family_id_4, :KEGG_link, :GWAS_link, :pharm_link)
		end
	
end

