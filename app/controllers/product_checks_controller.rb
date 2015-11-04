class ProductChecksController < ApplicationController
  layout 'templabel'
  
  def checkproduct
    if params[:barcode]
      if !Product.exists?(:barcode => params[:barcode])  
        
         else
                    @productmesa = Product.find_by_barcode_and_location(params[:barcode], "/enterprise/Establishment/1/")
                    @productphx = Product.find_by_barcode_and_location(params[:barcode], "/enterprise/Establishment/3/")
        
      end
    end
  end
  
end