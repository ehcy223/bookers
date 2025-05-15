Rails.application.routes.draw do
  root 'books#top'         # トップページ（例: https://〜/）
  resources :books         # Book のCRUDアクションを自動生成
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
