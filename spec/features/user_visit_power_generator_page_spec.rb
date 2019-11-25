require 'rails_helper'

feature 'User visit power generator page' do
	scenario 'successfully from home' do
		product_one = create(:power_generator, name: "Produto 1")
		product_two = create(:power_generator, name:'Produto 2')


		visit root_path
		click_on 'PRODUTO 1'

		expect(current_path).to eq power_generator_path(product_one)
		expect(page).to have_content(product_one.name)
		expect(page).not_to have_content(product_two.name)

	end

	scenario 'successfully from simple seach' do
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
		click_on "PRODUTO 2"

		expect(current_path).to eq power_generator_path(product_220v)
		expect(page).to have_content(product_220v.name)
		expect(page).not_to have_content(product_110v.name)

	end

	scenario 'successfully from recommended seach' do
		product_a = create(:power_generator, name:'AA', structure_type: 3, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 220v' )
		product_b = create(:power_generator, name:'BB', structure_type: 1, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 110v' )
		product_c = create(:power_generator, name:'CC', structure_type: 1, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 110v' )
		product_d = create(:power_generator, name:'DD', structure_type: 1, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 220v' )


		visit root_path
		click_on 'Recomendados para você'
		select 'laje', from: 'Tipo de Estrutura'
		fill_in 'Palavra Chave', with: '220v'
		click_on 'Buscar'
		click_on 'AA'

		expect(current_path).to eq power_generator_path(product_a)
		expect(page).to have_content(product_a.name)
		expect(page).not_to have_content(product_b.name)

	end
end