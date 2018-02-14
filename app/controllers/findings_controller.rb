class FindingsController < ApplicationController

	def index
		@findings = Finding.all
	end
	
	def search
		@search_results = Finding.search(params[:search_keywords])
	end
	
	def create
		#NEED TO UPDATE PARAMS TO BE PAPER PARAMS
		@finding = Finding.new(params.require(:finding).permit(:id, :gene_name, :variant, :num_studies_testing_var, :PMID, :primary_study_p_value, :primary_study_or, :primary_study_95_ci, :primary_study_case_allele, :primary_study_association_description, :primary_study_p_value_significance_threshold, :primary_study_significant_y_n, :secondary_study_y_n, :secondary_study_replication_y_n, :secondary_study_description, :secondary_study_p_value, :secondary_study_or, :secondary_study_95_ci, :secondary_study_case_allele, :secondary_study_association_description, :secondary_study_p_value_significance_threshold, :secondary_study_significant_y_n, :tertiary_study_y_n, :tertiary_study_replication_y_n, :tertiary_study_p_value, :tertiary_study_or, :tertiary_study_95_ci, :tertiary_study_case_allele, :tertiary_study_association_description, :tertiary_study_p_value_significance_threshold, :tertiary_study_significant_y_n, :combined_analysis_y_n, :combined_study_p_value, :combined_study_or, :combined_study_95_ci, :combined_study_case_allele, :combined_study_association_description, :combined_study_p_value_significance_threshold, :combined_study_significant_y_n))
		
		@findings = Finding.all
		
		@findings.each do |f|
			if (@finding.PMID == f.PMID) && (@finding.variant == f.variant)
				return
			end
		end
		
		if @finding.save
			redirect_to af_index_path
		else
			render "new"
		end
	end
	
	def update
		@finding = Finding.find(params[:id])
		if @finding.update_attributes(find_params)
			redirect_to af_index_path
		end
	end
	
	def show
	end
	
	private
	#NEED TO UPDATE PARAMS TO BE PAPER FIELDS
		def find_params
			params.require(:finding).permit(:id, :gene_name, :variant, :num_studies_testing_var, :PMID, :primary_study_p_value, :primary_study_or, :primary_study_95_ci, :primary_study_case_allele, :primary_study_association_description, :primary_study_p_value_significance_threshold, :primary_study_significant_y_n, :secondary_study_y_n, :secondary_study_replication_y_n, :secondary_study_description, :secondary_study_p_value, :secondary_study_or, :secondary_study_95_ci, :secondary_study_case_allele, :secondary_study_association_description, :secondary_study_p_value_significance_threshold, :secondary_study_significant_y_n, :tertiary_study_y_n, :tertiary_study_replication_y_n, :tertiary_study_p_value, :tertiary_study_or, :tertiary_study_95_ci, :tertiary_study_case_allele, :tertiary_study_association_description, :tertiary_study_p_value_significance_threshold, :tertiary_study_significant_y_n, :combined_analysis_y_n, :combined_study_p_value, :combined_study_or, :combined_study_95_ci, :combined_study_case_allele, :combined_study_association_description, :combined_study_p_value_significance_threshold, :combined_study_significant_y_n)
		end
end
