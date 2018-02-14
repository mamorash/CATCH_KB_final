class Variant < ApplicationRecord

	
	def index
		@variants = Variant.all
	end
end