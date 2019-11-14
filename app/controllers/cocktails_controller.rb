class CocktailsController < ApplicationController

  def index
    # get all the cocktails
    @cocktails = Cocktail.all
  end

  def show
    # localhost3000/cocktails/1
    # use params to find cocktail we clicked on before
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    # only because `simple_form` needs an instance
    @cocktail = Cocktail.new
  end

  def create
    # save the data from the form in a Cocktail instance
    @cocktail = Cocktail.new(cocktail_params)
    # save it in the DB
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    # only keep what we want from the params
    params.require(:cocktail).permit(:name)
  end

end











