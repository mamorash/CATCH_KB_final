class AdminController < ApplicationController

	http_basic_authenticate_with name: "madmin", password: "t0ps3cRet"
	
	def index
	end
	
	def new
	end
	
	def edit
	end
	
	def update
	end
	
	def show
	end
	
end