Rails.application.routes.draw do

  resource :game do
    collection do
      patch :reveal
      post :reset
    end
  end

  root 'games#index'

end
