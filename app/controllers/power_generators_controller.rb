class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all
  end

  def recommendations
    
  end

  def search
    @power_generators = PowerGenerator.where(
      "name LIKE :param or description LIKE :param", 
      {param: "%#{params[:search_power_generator]}%"}
    )
    
    if @power_generators.empty?
      flash.now[:error] = 'Descupe! não encontramos nenhum produto'
    else
      flash.now[:notice] = 'Encontramos esse(s) produto(s)'

    end
    
  end

  private
  # def power_enerator_params
  #   params.require(:power_generators).permit(:name, :description, :image_url, :manufacturer, :structure_type, 
  #                                           :price, :height, :width, :lenght, :weight, :kwp)
  # end

end
