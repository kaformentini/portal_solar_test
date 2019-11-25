class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all
  end

  def show
      @power_generator = PowerGenerator.find(params[:id])
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

  def freight
    
  end
end