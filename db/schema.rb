# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2) do

  create_table "cancer_details", primary_key: "cancer_name", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "SNOMED_SCTID"
  end

  create_table "drug_details", primary_key: "RxNorm_CUI", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "drug_name",  limit: 20,    null: false
    t.text   "pharm_link", limit: 65535
    t.text   "SIDER_link", limit: 65535
  end

  create_table "findings", primary_key: "pri_index", id: :string, limit: 20, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "gene_name"
    t.string  "variant"
    t.integer "num_studies_testing_var"
    t.text    "PMID",                                           limit: 65535
    t.float   "primary_study_p_value",                          limit: 53
    t.float   "primary_study_or",                               limit: 53
    t.text    "primary_study_95_ci",                            limit: 65535
    t.text    "primary_study_case_allele",                      limit: 65535
    t.text    "primary_study_association_description",          limit: 65535
    t.text    "primary_study_p_value_significance_threshold",   limit: 65535
    t.text    "primary_study_significant_y_n",                  limit: 65535
    t.text    "secondary_study_y_n",                            limit: 65535
    t.text    "secondary_study_replication_y_n",                limit: 65535
    t.text    "secondary_study_description",                    limit: 65535
    t.float   "secondary_study_p_value",                        limit: 53
    t.float   "secondary_study_or",                             limit: 53
    t.text    "secondary_study_95_ci",                          limit: 65535
    t.text    "secondary_study_case_allele",                    limit: 65535
    t.text    "secondary_study_association_description",        limit: 65535
    t.text    "secondary_study_p_value_significance_threshold", limit: 65535
    t.text    "secondary_study_significant_y_n",                limit: 65535
    t.text    "tertiary_study_y_n",                             limit: 65535
    t.text    "tertiary_study_replication_y_n",                 limit: 65535
    t.float   "tertiary_study_p_value",                         limit: 53
    t.float   "tertiary_study_or",                              limit: 53
    t.text    "tertiary_study_95_ci",                           limit: 65535
    t.text    "tertiary_study_case_allele",                     limit: 65535
    t.text    "tertiary_study_association_description",         limit: 65535
    t.text    "tertiary_study_p_value_significance_threshold",  limit: 65535
    t.text    "tertiary_study_significant_y_n",                 limit: 65535
    t.text    "combined_analysis_y_n",                          limit: 65535
    t.float   "combined_study_p_value",                         limit: 53
    t.float   "combined_study_or",                              limit: 53
    t.text    "combined_study_95_ci",                           limit: 65535
    t.text    "combined_study_case_allele",                     limit: 65535
    t.text    "combined_study_association_description",         limit: 65535
    t.text    "combined_study_p_value_significance_threshold",  limit: 65535
    t.text    "combined_study_significant_y_n",                 limit: 65535
  end

  create_table "genes", primary_key: "gene_name", id: :string, limit: 20, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "variant_list",  limit: 65535
    t.string  "family_name_1"
    t.integer "family_id_1"
    t.string  "family_name_2"
    t.integer "family_id_2"
    t.string  "family_name_3"
    t.integer "family_id_3"
    t.string  "family_name_4"
    t.integer "family_id_4"
    t.text    "KEGG_link",     limit: 65535
    t.text    "GWAS_link",     limit: 65535
    t.text    "pharm_link",    limit: 65535
  end

  create_table "mo_papers", primary_key: "PMID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date   "study_date"
    t.text   "model_organism",         limit: 65535
    t.text   "animal_age",             limit: 65535
    t.string "animal_gender",          limit: 20
    t.text   "group_descriptions",     limit: 65535
    t.string "drug_exposure",          limit: 20
    t.string "drug_schedule"
    t.string "cumulative_dose",        limit: 20
    t.string "tumor_type",             limit: 20
    t.text   "how_ctx_measured",       limit: 65535
    t.string "human_gene_name",        limit: 20
    t.text   "gene_altered_direction", limit: 65535
    t.text   "gene_altered_method",    limit: 65535
    t.text   "assoc_desc",             limit: 65535
  end

  create_table "papers", primary_key: "PMID", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date    "study_date"
    t.string  "canddiate_or_GWAS",                          limit: 20
    t.integer "num_SNPs"
    t.string  "prospective_or_retrospective",               limit: 20
    t.text    "how_cardiotoxicity_measured",                limit: 65535
    t.string  "EF_threshold",                               limit: 20
    t.text    "cancer_type",                                limit: 65535
    t.text    "drug_exposed_to",                            limit: 65535
    t.string  "cumulative_dose_measurement_type"
    t.string  "cumulative_dose_unit",                       limit: 20
    t.string  "cumulative_dose_combined_value"
    t.string  "cumulative_dose_discovery_case"
    t.string  "cumulative_dose_discovery_control"
    t.string  "cumulative_dose_replication_case"
    t.string  "cumulative_dose_replication_control"
    t.string  "cumulative_dose_replication_2_case"
    t.string  "cumulative_dose_replication_2_control"
    t.text    "CTCAE_level",                                limit: 65535
    t.text    "cardiotoxicity_description",                 limit: 65535
    t.string  "follow_up_measurement_type"
    t.string  "follow_up_unit",                             limit: 20
    t.string  "follow_up_description"
    t.string  "follow_up_discovery_combined_value"
    t.string  "follow_up_discovery_case_value"
    t.string  "follow_up_discovery_control_value"
    t.string  "follow_up_replication_combined_value"
    t.string  "follow_up_replication_case_value"
    t.string  "follow_up_replication_control_value"
    t.string  "follow_up_replication_2_case_value"
    t.string  "follow_up_replication_2_control_value"
    t.string  "population_age_measurement_type"
    t.string  "population_age_unit",                        limit: 20
    t.string  "population_age_discovery_combined_value"
    t.string  "population_age_discovery_case_value"
    t.string  "population_age_discovery_control_value"
    t.string  "population_age_replication_combined_value"
    t.string  "population_age_replication_case_value"
    t.string  "population_age_replication_control_value"
    t.string  "population_age_replication_2_case_value"
    t.string  "population_age_replication_2_control_value"
    t.string  "population_race_discovery"
    t.string  "population_race_replication"
    t.string  "poulation_race_replication_2"
    t.string  "population_sex_measurement_type"
    t.integer "population_sex_discovery_combined_value"
    t.integer "population_sex_discovery_case_value"
    t.integer "population_sex_discovery_control_value"
    t.integer "population_sex_replication_combined_value"
    t.integer "population_sex_replication_case_value"
    t.integer "population_sex_replication_control_value"
    t.integer "population_sex_replication_2_case_value"
    t.integer "population_sex_replication_2_control_value"
    t.text    "confound_factors_monitored",                 limit: 65535
    t.integer "study_size_discovery"
    t.integer "num_discovery_cases"
    t.integer "study_size_replication"
    t.integer "num_replication_cases"
    t.integer "study_size_replication_2"
    t.integer "num_replication_2_cases"
    t.text    "study_cohort_notes",                         limit: 65535
    t.text    "sequencing_platform",                        limit: 65535
  end

  create_table "variants", primary_key: "variant", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "gene"
  end

end
