class Mo_paper < ApplicationRecord

	
	def index
		@mo_papers=Mo_paper.all
	end
	
	def self.search(keywords)
		
		keywords= "%" + keywords + "%"
		Mo_paper.where("human_gene_name LIKE ? OR PMID LIKE ?", keywords,keywords)
	end
	
end
