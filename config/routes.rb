Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'genes#home'
  
  get 'search' => 'genes#search', as: 'search'
  get 'mo_search' => 'genes#mo_search', as: 'mo_search'
  #get 'mo_internal_search' => 'mo_papers#internal_search'
  get 'internal_search' => 'genes#internal_search'
  get 'gene_detail' => 'genes#gene_detail', as: 'gene_detail'
  get 'study_detail' => 'genes#study_detail', as: 'study_detail'
  get 'cancer_detail' => 'genes#cancer_detail', as: 'cancer_detail'
  get 'drug_detail' => 'genes#drug_detail', as: 'drug_detail'
 
 get 'edit' => 'admin#edit', as: 'edit'
  get 'show' => 'admin#show', as: 'show'
  get 'update' => 'admin#update', as: 'update'
  get 'new_gene' => 'admin_gene#new', as: 'new'
  get 'new_paper' => 'admin_paper#new'
  get 'new_find' => 'admin_find#new'
  get 'new_cancer' => 'admin_cancer#new'
  get 'new_drug' => 'admin_drug#new'
  get 'index' => 'admin#index', as: 'index'
  get 'ag_index' => 'admin_gene#index'
  get 'ap_index' => 'admin_paper#index'
  get 'af_index' => 'admin_find#index'
  get 'ac_index' => 'admin_cancer#index'
  get 'ad_index' => 'admin_drug#index'
  get 'ag_edit' => 'admin_gene#edit'
  get 'ag_destroy' => 'admin_gene#destroy'
  get 'ap_edit' => 'admin_paper#edit'
  get 'ap_destroy' => 'admin_paper#destroy'
  get 'af_edit' => 'admin_find#edit'
  get 'af_destroy' => 'admin_find#destroy'
  get 'ac_edit' => 'admin_cancer#edit'
  get 'ac_destroy' => 'admin_cancer#destroy'
  get 'ad_edit' => 'admin_drug#edit'
  patch 'drug_detail.:id', to: 'drug_details#update'
  patch 'cancer_detail.:id', to: 'cancer_details#update'
  get 'ad_destroy' => 'admin_drug#destroy'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :papers
  resources :genes
  resources :findings
  resources :drug_details
  resources :cancer_details
  resources :admin_cancer
  resources :admin_drug
  resources :variants
  resources :mo_papers
end
