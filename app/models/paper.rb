class Paper < ApplicationRecord
	
	def self.search(keywords)
		
		papers = []
		keywords.each do |keyword|
			papers << keyword.PMID
		end
		
		
		results=[]
		papers.each do |paper| 
			paper= "%" + paper + "%"
			results << Paper.where("PMID LIKE ?", paper).first
		end
		results
		
	end
	
	def index
		@papers=Paper.all
	end
end
