class PapersController < ApplicationController

	def index
		@papers = Paper.all
	end
	
	def search
		@search_results = Paper.search(params[:search_keywords])
	end
	
	
	def create
		#NEED TO UPDATE PARAMS TO BE PAPER PARAMS
		@paper = Paper.new(params.require(:paper).permit(:PMID, :study_date, :canddiate_or_GWAS, :num_SNPs, :prospective_or_retrospective, :how_cardiotoxicity_measured, :EF_threshold, :cancer_type, :drug_exposed_to, :cumulative_dose_measurement_type, :cumulative_dose_unit, :cumulative_dose_combined_value, :cumulative_dose_discovery_case, :cumulative_dose_discovery_control, :cumulative_dose_replication_case, :cumulative_dose_replication_control, :cumulative_dose_replication_2_case, :cumulative_dose_replication_2_control, :CTCAE_level, :cardiotoxicity_description, :follow_up_measurement_type, :follow_up_unit, :follow_up_description, :follow_up_discovery_combined_value, :follow_up_discovery_case_value, :follow_up_discovery_control_value, :follow_up_replication_combined_value, :follow_up_replication_case_value, :follow_up_replication_control_value, :follow_up_replication_2_case_value, :follow_up_replication_2_control_value, :population_age_measurement_type, :population_age_unit, :population_age_discovery_combined_value, :population_age_discovery_case_value, :population_age_discovery_control_value, :population_age_replication_combined_value, :population_age_replication_case_value, :population_age_replication_control_value, :population_age_replication_2_case_value, :population_age_replication_2_control_value, :population_race_discovery, :population_race_replication, :poulation_race_replication_2, :population_sex_measurement_type, :population_sex_discovery_combined_value, :population_sex_discovery_case_value, :population_sex_discovery_control_value, :population_sex_replication_combined_value, :population_sex_replication_case_value, :population_sex_replication_control_value, :population_sex_replication_2_case_value, :population_sex_replication_2_control_value, :confound_factors_monitored, :study_size_discovery, :num_discovery_cases, :study_size_replication, :num_replication_cases, :study_size_replication_2, :num_replication_2_cases, :study_cohort_notes, :sequencing_platform))
		
		@papers = Paper.all
		
		@papers.each do |p|
			if @paper.PMID == p.PMID
				return
			end
		end
		
		if @paper.save
			redirect_to ap_index_path
		else
			render "new"
		end
	end
	
	def update
		@paper = Paper.find(params[:id])
		if @paper.update_attributes(paper_params)
			redirect_to ap_index_path
		end
	end
	
	private
	#NEED TO UPDATE PARAMS TO BE PAPER FIELDS
		def paper_params
			
			params.require(:paper).permit(:PMID, :study_date, :canddiate_or_GWAS, :num_SNPs, :prospective_or_retrospective, :how_cardiotoxicity_measured, :EF_threshold, :cancer_type, :drug_exposed_to, :cumulative_dose_measurement_type, :cumulative_dose_unit, :cumulative_dose_combined_value, :cumulative_dose_discovery_case, :cumulative_dose_discovery_control, :cumulative_dose_replication_case, :cumulative_dose_replication_control, :cumulative_dose_replication_2_case, :cumulative_dose_replication_2_control, :CTCAE_level, :cardiotoxicity_description, :follow_up_measurement_type, :follow_up_unit, :follow_up_description, :follow_up_discovery_combined_value, :follow_up_discovery_case_value, :follow_up_discovery_control_value, :follow_up_replication_combined_value, :follow_up_replication_case_value, :follow_up_replication_control_value, :follow_up_replication_2_case_value, :follow_up_replication_2_control_value, :population_age_measurement_type, :population_age_unit, :population_age_discovery_combined_value, :population_age_discovery_case_value, :population_age_discovery_control_value, :population_age_replication_combined_value, :population_age_replication_case_value, :population_age_replication_control_value, :population_age_replication_2_case_value, :population_age_replication_2_control_value, :population_race_discovery, :population_race_replication, :poulation_race_replication_2, :population_sex_measurement_type, :population_sex_discovery_combined_value, :population_sex_discovery_case_value, :population_sex_discovery_control_value, :population_sex_replication_combined_value, :population_sex_replication_case_value, :population_sex_replication_control_value, :population_sex_replication_2_case_value, :population_sex_replication_2_control_value, :confound_factors_monitored, :study_size_discovery, :num_discovery_cases, :study_size_replication, :num_replication_cases, :study_size_replication_2, :num_replication_2_cases, :study_cohort_notes, :sequencing_platform)
			
			#params.require(:gene).permit(:gene_name, :variant_list, :family_name_1, :family_id_1, :family_name_2, :family_id_2, :family_name_3, :family_id_3,:family_name_4, :family_id_4, :kegg_link, :gwas_link, :pharm_link)
		end
end