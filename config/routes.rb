Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  scope :api do
    scope :v1 do
      get 'image_groups/:image_group_id/images/random', to: 'api/v1/images#random'
    end
  end
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
