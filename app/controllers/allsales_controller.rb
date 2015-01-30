class AllsalesController < ApplicationController

  def index
    @grid = AllsalesGrid.new(params[:allsales_grid]) do |scope|
      scope.page(params[:page])
    end
  end

end

