class PowerGeneratorsController < ApplicationController
  before_action :pagination, only: %i[index show]

  def index; end

  def show
    @power_generator = PowerGenerator.find(params[:id])
    return unless params[:cep].present?

    @address = calculate_cep
    return flash.now[:notice] = 'CEP não encontrado' if @address.empty?

    @power_generator_freight = PowerGenerator.freight(@address, @power_generator)
  end

  def search
    @power_generators = PowerGenerator.search(params[:search_power_generator])

    if @power_generators.empty?
      flash.now[:error] = 'Descupe! não encontramos nenhum produto'
    else
      flash.now[:notice] = 'Encontramos esse(s) produto(s)'
    end
  end

  def recommended_search
    @power_generators = PowerGenerator.recommended_search(params)
    redirect_to search_power_generators_path(@power_generators)
  end

  private

  def power_generator_params
    params.require(:power_generator).permit(:name, :description, :image_url, 
                                            :manufacturer, :structure_type, 
                                            :price, :height, :width, :length,
                                            :weight, :kwp, :size, :cost_benefit)
  end
  
  def calculate_cep
    Correios::CEP::AddressFinder.get(params[:cep])
  end
  
  def pagination
    products_by_page = 6
    @array_num_pages = (1 .. ( (PowerGenerator.all.length / products_by_page.to_f).ceil )).to_a
    @page = params.fetch(:page, 0).to_i
    @power_generators = PowerGenerator.offset(@page * products_by_page).limit(products_by_page)
  end

end