class DosesController < ApplicationController
  def new
    # get the cocktail from the url (rails routes / nested)
    @cocktail = Cocktail.find(params[:cocktail_id])
    # only because `simple_form` needs an instance
    @dose = Dose.new
  end

  def create
    # get the cocktail from the url (rails routes / nested)
    @cocktail = Cocktail.find(params[:cocktail_id])
    # save the data from the form in a Dose instance
    @dose = Dose.new(dose_params)
    # link the dose and cocktail together
    @dose.cocktail = @cocktail
    # save the instance in the DB
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
