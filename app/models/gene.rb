class Gene < ApplicationRecord
	
	def self.search(keywords)
		
		genes = []
		keywords.each do |keyword|
			exist=false
			genes.each do |g|
				if keyword.gene_name==g
					exist=true
				end
			end
			if exist==false	
				genes << keyword.gene_name
			end
			exist=false
		end
		
		results=[]
		genes.each do |gene| 
			gene= "%" + gene + "%"
			results << Gene.where("gene_name LIKE ?", gene).first
		end
		results
	end
	
	def index
		@genes=Gene.all
	end
	
end