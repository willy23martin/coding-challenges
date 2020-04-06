Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match '/retrieval/result', to: 'memcached_retrieval_commands#result', via: [:post]
  root 'memcached_retrieval_commands#index'
end
