Rails.application.routes.draw do
  root "home#index"

  get "/quiz/start", to: "quiz#start"
  get "/quiz/question/:question_index", to: "quiz#question", as: "quiz_question"
  get "/quiz/result", to: "quiz#result"
  post "/quiz/submit_answer", to: "quiz#submit_answer"
  resources :rankings, only: [ :index, :create ]
  resources :questions, only: [ :index ]
end
