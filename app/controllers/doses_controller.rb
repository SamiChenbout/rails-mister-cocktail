class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def destroy
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose = Dose.find(params[:id])
   @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  private
  def dose_params
   params.require(:dose).permit(:description, :ingredient_id)
  end
end
