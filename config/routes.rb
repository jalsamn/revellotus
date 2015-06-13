Rails.application.routes.draw do
  
  ###### API ROUTES #######
  
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      # We are going to list our resources here
      resources :users, :only => [:show]
      #FOR MESA
      resources :templabels, :only => [:index, :create, :show]
      get 'csv', to: 'templabels#spitcsv'
      #FOR Phoenix
      resources :phxtemplabels, :only => [:index, :create, :show]
      get 'phxcsv', to: 'templabels#spitcsv'
    end
  end
  
  #########################
  

  resources :productrequests

  resources :produce_order_items

  resources :produce_orders

  resources :rinventors

  resources :rev_inventories

  resources :allsales
  resources :orderitems
    resources :phxtemplabels 
  resources :templabels 
  get 'csv', to: 'templabels#spitcsv'
  get 'csvphx', to: 'phxtemplabels#spitcsv'
  get 'phxlabelmessage', to: 'phxtemplabels#labelmessage'
  get 'labelmessage', to: 'templabels#labelmessage'
  #get 'totalsales', to: 'orderitems#totalsales'
  match 'totalsales', to: 'orderitems#totalsales', via: [:get, :post]
  match 'poorinventorydate', to: 'orderitems#poorinventorydate', via: [:get, :post]
  match 'poorinventory', to: 'orderitems#poorinventory', via: [:get, :post]
  match 'salesforproducedate', to: 'orderitems#salesforproducedate', via: [:get, :post]
  match 'salesforproduce', to: 'orderitems#salesforproduce', via: [:get, :post]



  resources :products
  
  root to: 'templabels#index'


end
