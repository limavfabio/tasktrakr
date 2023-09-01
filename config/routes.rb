# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :users, only: %i[ create update destroy ]

  resources :projects, shallow: true, except: %i[ index ] do
    resources :tasks, except: %i[ index ] do
      patch 'reorder', on: :member
    end

    post 'add_collaborator', on: :member
    get 'inbox', on: :collection
  end

  root 'projects#inbox'

  mount ActionCable.server => '/cable'
end
