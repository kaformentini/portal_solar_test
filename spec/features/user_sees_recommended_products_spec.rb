require 'rails_helper'

feature 'User sees your recommended products' do
    scenario 'succesffully by price' do
        products_cheap_low = create(:power_generator, name:'Mais Barato 1', price: 5000.00)
        products_cheap_high = create(:power_generator, name:'Mais Barato 2', price: 4000.00)
        products_expensive_low = create(:power_generator, name:'Mais Caro 1', price: 60000.00)
        products_expensive_high = create(:power_generator, name:'Mais Caro 2', price: 50000.00)
        
        visit root_path
        click_on 'Recomendados para você'
        check 'Menor Custo'
        click_on 'Buscar'
            
        expect(page).to have_content('Nós indicamos para você:')
        expect(page).to have_content(products_cheap_low.name)
        expect(page).to have_content(products_cheap_high.name)
        expect(page).not_to have_content(products_expensive_low.name)
        expect(page).not_to have_content(products_expensive_high.name)
    end

    scenario 'succesffully by weigth' do
        products_lowest_low = create(:power_generator, name:'Mais leve 1', weight: 142)
        products_lowest_high = create(:power_generator, name:'Mais leve 2', weight: 120)
        products_highest_low = create(:power_generator, name:'Mais pesado 1', weight: 300)
        products_highest_high = create(:power_generator, name:'Mais pesado 2', weight: 250)
        
        visit root_path
        click_on 'Recomendados para você'
        check 'Menor Peso'
        click_on 'Buscar'
            
        expect(page).to have_content('Nós indicamos para você:')
        expect(page).to have_content(products_lowest_low.name)
        expect(page).to have_content(products_lowest_high.name)
        expect(page).not_to have_content(products_highest_low.name)
        expect(page).not_to have_content(products_highest_high.name)
    end

    scenario 'succesffully by size' do
        products_a = create(:power_generator, name:'AA', size: 0.7)
        products_b = create(:power_generator, name:'BB', size: 0.2)
        products_c = create(:power_generator, name:'CC', size: 0.8)
        products_d = create(:power_generator, name:'DD', size: 0.1)
        
        visit root_path
        click_on 'Recomendados para você'
        check 'Menor Tamanho'
        click_on 'Buscar'
            
        expect(page).to have_content('Nós indicamos para você:')
        expect(page).to have_content(products_b.name)
        expect(page).to have_content(products_d.name)
        expect(page).not_to have_content(products_a.name)
        expect(page).not_to have_content(products_c.name)
    end

    scenario 'succesffully by two campus' do
        products_a = create(:power_generator, name:'AA', price: 5000.00, weight: 100)
        products_b = create(:power_generator, name:'BB', price: 4000.00, weight: 400)
        products_c = create(:power_generator, name:'CC', price: 60000.00, weight: 50)
        products_d = create(:power_generator, name:'DD', price: 50000.00, weight: 350)
        
        visit root_path
        click_on 'Recomendados para você'
        check 'Menor Custo'
        check 'Menor Peso'
        click_on 'Buscar'
            
        eq(recommended_searches_path)
        expect(page).to have_content('Nós indicamos para você:')
        expect(page).to have_content(products_a.name)
        expect(page).not_to have_content(products_b.name)
        expect(page).not_to have_content(products_c.name)
        expect(page).not_to have_content(products_d.name)
    end

    scenario 'succesffully by price and keyword' do
        products_a = create(:power_generator, name:'AA', price: 5000.00, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 220v' )
        products_b = create(:power_generator, name:'BB', price: 4000.00, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 110v' )
        products_c = create(:power_generator, name:'CC', price: 60000.00, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 110v' )
        products_d = create(:power_generator, name:'DD', price: 50000.00, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 220v' )
        
        visit root_path
        click_on 'Recomendados para você'
        check 'Menor Custo'
        fill_in 'Palavra Chave', with: '220v'
        click_on 'Buscar'
            
        eq(recommended_searches_path)
        expect(page).to have_content('Nós indicamos para você:')
        expect(page).to have_content(products_a.name)
        expect(page).not_to have_content(products_b.name)
        expect(page).not_to have_content(products_c.name)
        expect(page).not_to have_content(products_d.name)
    end

    scenario 'succesffully by structure_type and keyword' do
        products_a = create(:power_generator, name:'AA', structure_type: 3, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 220v' )
        products_b = create(:power_generator, name:'BB', structure_type: 1, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 110v' )
        products_c = create(:power_generator, name:'CC', structure_type: 1, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 110v' )
        products_d = create(:power_generator, name:'DD', structure_type: 1, description: 'Lorem ipsum nisi libero, tellus himenaeos maecenas sollicitudin, convallis praesent. 220v' )
        
        visit root_path
        click_on 'Recomendados para você'
        select 'laje', from: 'Tipo de Estrutura'
        fill_in 'Palavra Chave', with: '220v'
        click_on 'Buscar'
            
        eq(recommended_searches_path)
        expect(page).to have_content('Nós indicamos para você:')
        expect(page).to have_content(products_a.name)
        expect(page).not_to have_content(products_b.name)
        expect(page).not_to have_content(products_c.name)
        expect(page).not_to have_content(products_d.name)
    end


end