Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'main#index'

  resources :questions do
    resources :answers
  end

  get '/questions_asked'     => 'main#user_questions',      as: :questions_asked
  get '/answers_given'       => 'main#user_answers',        as: :answers_given
  post '/new_comment'        => 'main#new_comment' ,        as: :new_comment
  post '/up_vote/:id'        => 'main#up_vote',             as: :up_vote
  post '/down_vote/:id'      => 'main#down_vote',           as: :down_vote
  post '/answer_comment/:id' => 'main#answer_comment',      as: :answer_comment  
end
