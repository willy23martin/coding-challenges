Rails.application.routes.draw do
  get 'memcached_storage_commands/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match '/retrieval', to: 'memcached_retrieval_commands#index', via: [:get]
  match '/retrieval/result', to: 'memcached_retrieval_commands#result', via: [:post]
  match '/storage', to: 'memcached_storage_commands#index', via: [:get]
  match '/storage/result', to: 'memcached_storage_commands#result', via: [:post]
  root 'memcached_retrieval_commands#index'
end
