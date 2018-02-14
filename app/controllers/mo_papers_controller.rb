class MoPapersController < ApplicationController

	def index
		@mo_papers = Mo_paper.all
	end
	
	

	

end