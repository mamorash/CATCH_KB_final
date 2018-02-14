class Cancer_detail < ApplicationRecord
	
	def self.search(keywords)
		
		cancers = []
		keywords.each do |keyword|
			if keyword.cancer_type!=nil
				temp=keyword.cancer_type.split(/with|or|and/)
				temp.each do |t|
					exist=false
					t=t.strip
					cancers.each do |c|
						c=c.strip
						if t==c
							exist=true
						end
					end
					if exist==false	
						cancers << t
					end
					exist=false
				end
			end
		end
		
		results=[]
		cancers.each do |cancer| 
			cancer= "%" + cancer + "%"
			results << Cancer_detail.where("cancer_name LIKE ?", cancer).first
		end
		results
	end
	
	def index
		@cancer_details=Cancer_detail.all
	end
end
