class PowerGeneratorsController < ApplicationController

  
  def index
    products_by_page = 6
    @page  = params.fetch(:page,0).to_i
    @power_generators = PowerGenerator.offset(@page * products_by_page).limit(products_by_page)
  end

  def show
      @power_generator = PowerGenerator.find(params[:id])
      if params[:cep].present? 
        @address = calculate_cep
        return flash.now[:notice] = 'CEP não encontrado' unless not @address.empty?
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
  
  def calculate_cep
    Correios::CEP::AddressFinder.get(params[:cep])
  end

end