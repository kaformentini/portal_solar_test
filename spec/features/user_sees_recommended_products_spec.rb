require 'rails_helper'

feature 'User sees your recommended products' do
    scenario 'succesffully with one campus checked' do
        products_cheap_low = create(:power_generator, name:'Mais Barato 1', price: 5000.00)
        products_cheap_high = create(:power_generator, name:'Mais Barato 2', price: 4000.00)
        products_expensive_low = create(:power_generator, name:'Mais Caro 1', price: 15000.00)
        products_expensive_high = create(:power_generator, name:'Mais Caro 2', price: 50000.00)
        
        visit root_path
        click_on 'Recomendados para você'
        check 'Menor Custo'
        click_on 'Buscar'
            
        # expect(current_path).to eq(recommended_searches_path)
        expect(page).to have_content('Nós indicamos para você:')
        expect(page).to have_content(products_cheap_low.name)
        expect(page).to have_content(products_cheap_high.name)
        expect(page).not_to have_content(products_expensive_low.name)
        expect(page).not_to have_content(products_expensive_high.name)
    end
end