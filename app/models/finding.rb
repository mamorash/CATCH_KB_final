#require 'composite_primary_keys'
class Finding < ApplicationRecord
	
	#self.primary_key = :variant, :PMID
	
	def self.search(keywords)
		
		keywords= "%" + keywords + "%"
		Finding.where("gene_name LIKE ? OR variant LIKE ? OR PMID LIKE ?", keywords,keywords,keywords)
	end
	
	def self.internal_search (var, paper)
		@finding_by_var=Finding.search(var)
		@results=[]
		@finding_by_var.each do |v|
			if v.PMID==paper
				@results<<v
			end
		end
		@results
	end
	
	def index
		@findings=Finding.all
	end
end
