Rails.application.routes.draw do
  resources :candidates do
    member do
      post :vote
    end

    # collection do
    #   post :vote
    # end

  end


  # post '/candidates/:id/vote', to: "candidates#vote"
end
