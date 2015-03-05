class PastriesController < ApplicationController
  def index
  	@pastries = [
  		{
  			name: "Croissant", price_in_pence: 350, description: "delicious buttery pastry"
  		},
  		{
  			name: "Pain au Chocolat", price_in_pence: 380, description: "delicious chocolaty pastry"	
  		}]
  end

  def show
  end

  def new
  end

  def edit
  end
end
