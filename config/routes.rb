Rails.application.routes.draw do
  
  ###### API ROUTES #######
  
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      # We are going to list our resources here
      resources :users, :only => [:show]
      #FOR MESA
      resources :apitemplabels, :only => [:index, :create, :show]
      get 'csv', to: 'apitemplabels#spitcsv'
      #FOR Phoenix
      resources :apiphxtemplabels, :only => [:index, :create, :show]
      get 'phxcsv', to: 'apiphxtemplabels#spitcsv'
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
  get 'search_product_mesa', to: 'products#search_product_mesa'
  get 'search_product_phx', to: 'products#search_product_phx'
  get 'csv', to: 'templabels#spitcsv'
  get 'csvphx', to: 'phxtemplabels#spitcsv'
  get 'phxlabelmessage', to: 'phxtemplabels#labelmessage'
  get 'phxsendtoprintserver', to: 'phxtemplabels#phxsendtoprintserver'
  
  get 'labelmessage', to: 'templabels#labelmessage'
  #get 'totalsales', to: 'orderitems#totalsales'
  match 'totalsales', to: 'orderitems#totalsales', via: [:get, :post]
  match 'poorinventorydate', to: 'orderitems#poorinventorydate', via: [:get, :post]
  match 'poorinventory', to: 'orderitems#poorinventory', via: [:get, :post]
  match 'salesforproducedatebreakdown', to: 'orderitems#salesforproducedatebreakdown', via: [:get, :post]
  match 'salesforproducebreakdown', to: 'orderitems#salesforproducebreakdown', via: [:get, :post]
  
  match 'salesforproducedatephx', to: 'orderitems#salesforproducedatephx', via: [:get, :post]
  match 'salesforproducephx', to: 'orderitems#salesforproducephx', via: [:get, :post]
  
  match 'salesforproducedateall', to: 'orderitems#salesforproducedateall', via: [:get, :post]
  match 'salesforproduceall', to: 'orderitems#salesforproduceall', via: [:get, :post]
  
  match 'set_fullfilled', to: 'productrequests#set_fullfilled', via: [:get, :post]
  match 'set_notfullfilled', to: 'productrequests#set_notfullfilled', via: [:get, :post]

  match 'totalrevenuesalesdateall', to: 'orderitems#totalrevenuesalesdateall', via: [:get, :post]
  match 'totalrevenuesalesall', to: 'orderitems#totalrevenuesalesall', via: [:get, :post]

  match 'revenueforproducedateall', to: 'orderitems#revenueforproducedateall', via: [:get, :post]
  match 'revenueforproduceall', to: 'orderitems#revenueforproduceall', via: [:get, :post]
  
  match 'producemaintainance', to: 'products#produce', via: [:get, :post]
  match 'produceorderlocation', to: 'produce_orders#produceorderlocation', via: [:get, :post]
  
   match 'checkproduct', to: 'product_checks#checkproduct', via: [:get, :post]
  
  
  resources :products
  
  root to: 'templabels#index'


end
