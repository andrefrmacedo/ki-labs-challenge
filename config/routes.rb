Rails.application.routes.draw do
  scope :api do
    get 'candidate/:id/available', to: 'person_slots#index'
  end
end
