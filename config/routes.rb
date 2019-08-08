# frozen_string_literal: true

# == Route Map
#
#               Prefix Verb   URI Pattern             Controller#Action
#     new_user_session GET    /login(.:format)        sessions#new
#         user_session POST   /login(.:format)        sessions#create
# destroy_user_session DELETE /logout(.:format)       sessions#destroy
#               signup POST   /signup(.:format)       registration/users#create
#              profile GET    /profile(.:format)      users#profile
#             accounts GET    /accounts(.:format)     accounts#index
#                      POST   /accounts(.:format)     accounts#create
#             expenses GET    /expenses(.:format)     expenses#index
#                      POST   /expenses(.:format)     expenses#create
#              expense GET    /expenses/:id(.:format) expenses#show
#                      PATCH  /expenses/:id(.:format) expenses#update
#                      PUT    /expenses/:id(.:format) expenses#update
#                      DELETE /expenses/:id(.:format) expenses#destroy
#           categories GET    /categories(.:format)   categories#index
#           currencies GET    /currencies(.:format)   currencies#index
#           sync_index GET    /sync(.:format)         sync#index

Rails.application.routes.draw do
  devise_for :users,
    path: "",
    path_names: {
      sign_in:  "login",
      sign_out: "logout"
    },
    controllers: {
      sessions: "sessions"
    }

  post "signup", to: "registration/users#create"
  resources :expenses, only: %i[index show create]
end
