Rails.application.routes.draw do
  devise_for :staffs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :colleges do
    resources :departments do
      resources :students do
        post :performance_rating, on: :member
        resources :remarks, only: [:create, :destroy]
      end
    end
  end

  resources :area_of_interests
  root "colleges#index"
  get "/students", to: "students#all_student"
end
