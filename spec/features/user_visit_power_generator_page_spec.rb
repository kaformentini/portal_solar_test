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
end