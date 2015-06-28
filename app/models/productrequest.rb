class Productrequest < ActiveRecord::Base
  
  validates :name, :email, :location, :presence => true

  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |poductrequest|
      csv << productrequest.attributes.values_at(*column_names)
    end
  end
end
  
end
