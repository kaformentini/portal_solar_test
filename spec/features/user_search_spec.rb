require 'rails_helper'

feature 'User search for a product' do
  scenario 'successfully' do
    product_110v = create(:power_generator, name:'Produto 1', description: "2 MPPTs para adaptação versátil a diferentes tipos ou quantidades de módulos construídos com diferentes alinhamentos    
                                                                            Monitoramento inteligente de 4 strings e 80% de economia de tempo na detecção de falhas    
                                                                            Portas RS485 e USB para conectividade e gerenciamento de dados    
                                                                            Display LCD gráfico local e monitoramento remoto. Voltagem 110V" )
    product_220v = create(:power_generator, name:'Produto 2', description: "2 MPPTs para adaptação versátil a diferentes tipos ou quantidades de módulos construídos com diferentes alinhamentos    
                                                                            Monitoramento inteligente de 4 strings e 80% de economia de tempo na detecção de falhas    
                                                                            Portas RS485 e USB para conectividade e gerenciamento de dados    
                                                                            Display LCD gráfico local e monitoramento remoto. Voltagem 220V" )


    visit root_path
    fill_in "o que procura?", with: '220V'
    click_on "Pesquisar"

    expect(current_path).to eq(search_power_generators_path)
    expect(page).to have_content('Encontramos esses produtos')
    expect(page).to have_content(product_220v.name)
    expect(page).not_to have_content(product_110v.name)
  end
end