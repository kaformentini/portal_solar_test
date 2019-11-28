class PowerGeneratorsController < ApplicationController
  
  def index
    @power_generators = PowerGenerator.all
  end

  def show
      @power_generator = PowerGenerator.find(params[:id])
      # if parms[:cep].present?
        @address = Correios::CEP::AddressFinder.get(params[:cep])
        @power_generator = PowerGenerator.find(params[:id])
        @power_generator_freight = PowerGenerator.freight(@address, @power_generator)
      end
  end

  def recommendations
  end

  def search
    @power_generators = PowerGenerator.search(params[:search_power_generator])

    if @power_generators.empty?
      flash.now[:error] = 'Descupe! não encontramos nenhum produto'
    else
      flash.now[:notice] = 'Encontramos esse(s) produto(s)'
    end
  end


  private
  def power_generator_params
    params.require(:power_generator).permit(:name, :description, :image_url, :manufacturer,
                                            :structure_type, :price, :height, :width, :length,
                                            :weight, :kwp, :size, :cost_benefit)
  end

end