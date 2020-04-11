Rails.application.routes.draw do
  match '/retrieval', to: 'memcached_retrieval_commands#index', via: [:get, :post]
  match '/retrieval/result', to: 'memcached_retrieval_commands#result', via: [:post]
  match '/storage', to: 'memcached_storage_commands#index', via: [:get, :post]
  match '/storage/result', to: 'memcached_storage_commands#result', via: [:post]
  match '/', to: 'memcached_manager#index', via: [:get, :post]
  root 'memcached_manager#index'
end
