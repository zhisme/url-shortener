Rails.application.routes.draw do
  get '/:short_url', to: 'urls#show'
  post '/', to: 'urls#create'
end
