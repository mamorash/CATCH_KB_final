class Drug_detail < ApplicationRecord
	
	def self.search(keywords)
		drugs = []
		keywords.each do |keyword|
			if keyword.drug_exposed_to!=nil
				temp=keyword.drug_exposed_to.split(/ with | or | and /)
				temp.each do |t|
					exist=false
					t=t.strip
					drugs.each do |c|
						c=c.strip
						if t==c
							exist=true
						end
					end
					if exist==false	
						drugs << t
					end
					exist=false
				end
			end
		end
		
		results=[]
		drugs.each do |drug| 
			drug= "%" + drug + "%"
			results << Drug_detail.where("drug_name LIKE ?", drug).first
		end
		results
	end
	
	def index
		@drug_details=Drug_detail.all
	end
end

	