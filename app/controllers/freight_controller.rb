class FreightController < ApplicationController
  def cep
      @address = Correios::CEP::AddressFinder.get(params[:cep])
      ender json: @address, status: :create
  end
end
