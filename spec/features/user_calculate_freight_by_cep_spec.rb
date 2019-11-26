require "rails_helper"

feature "User calculate freight by cep" do
  scenario "successfully calculate cep" do
    power_generator_product = create(:power_generator, name:"Produto 1")
    city = "01001000" 

    visit power_generator_path(power_generator_product)
    click_on "Calcular frete"
    fill_in "CEP", with: city
    click_on "Calcular"


    expect(current_path).to eq cep_freight_index_path
    expect(page).to have_content('01001000')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('Sé')
    expect(page).to have_content('SP')
  end
end