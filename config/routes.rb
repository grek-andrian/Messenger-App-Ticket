Rails.application.routes.draw do
    devise_for :users, path_names: { sign_up: '' }, controllers: { sessions: 'sessions' }

    resources :users_admin, controller: 'users'

    root 'welcome#index'
    # mailbox folder routes
    get 'mailbox/inbox', to:  'mailbox#inbox', as: :mailbox_inbox
    get 'mailbox/sent', to: 'mailbox#sent', as: :mailbox_sent
    get 'mailbox/trash', to: 'mailbox#trash', as: :mailbox_trash

    resources :conversations do
        member do
            post :reply
            post :trash
            post :untrash
        end
    end
end
