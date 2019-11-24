require 'rails_helper'

feature 'User sees your recommended products' do
    pending
    scenario 'succesffully with one campus' do
        products_cheap = create(:power_generator, name:'Mais Barato', price: 1000.00)
        products_expensive = create(:power_generator, name:'Mais Caro', price: 4000.00)

        visit root_path
        click_on 'Recomendados para você'
        check 'Menor Preço'
            
        expect(current_path).to eq(recommendations_path)
        expect(page).to have_content('Nós indicamos para você:')
        expect(page).to have_content('Mais Barato')
    end
end