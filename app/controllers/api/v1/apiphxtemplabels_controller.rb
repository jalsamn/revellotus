class Api::V1::ApiphxtemplabelsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_filter :restrict_access
  respond_to :json

  def index
    respond_with Templabel.all
  end

def show
  respond_with Templabel.find(params[:id])
 end

def create
  templabel = Templabel.new(barcode: params[:barcode])

   
      if templabel.save
        respond_with templabel, status: 201

      else
        respond_with templabel.errors, status: :unprocessable_entity
      end
  end
  
def spitcsv
    
    templabels = Templabel.all
  
   require 'csv'
   require 'net/ftp'
  
      ftp = Net::FTP.new
      ftp.connect("lotusdelivery.com",21)
      ftp.login("jalsamn","t9zVhn~ckCz4")
      ftp.chdir("/public_html")
      ftp.passive = true
     
      header = "barcode,name,price,point"
      file = "barcodelabelsphx.csv"
             CSV.open(file, "w") do |csv|
             csv << ["Barcode", "Name", "Price", "Points"]
              templabels.each do |c|
                  if !Product.exists?(:barcode => c["barcode"])  
                  else
                    product = Product.find_by barcode: c["barcode"]
                    csv << [product.barcode, product.name, product.price.to_s, product.rewardpoint.to_s] 
                  end
             end
           end
     
     ftp.putbinaryfile(file, remotefile = File.basename(file))
     Templabel.delete_all()
     ftp.close
  
  respond_with status: 201
  
  end  
  
private
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end
  
end

