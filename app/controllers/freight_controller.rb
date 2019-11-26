class FreightController < ApplicationController
def cep
    @address = Correios::CEP::AddressFinder.get(params[:cep])
    render json: @address, status: :create
end

end
