Rails.application.routes.draw do
  resources :rinventors

  resources :rev_inventories

  resources :allsales
  resources :orderitems

  resources :templabels 
  get 'csv', to: 'templabels#spitcsv'
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
