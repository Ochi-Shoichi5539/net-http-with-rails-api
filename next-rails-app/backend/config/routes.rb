Rails.application.routes.draw do
  resources :qiita_items, only: %i(index)
end
