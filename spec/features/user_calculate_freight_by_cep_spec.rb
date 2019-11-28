require "rails_helper"

feature "User calculate freight by cep" do
  scenario "successfully calculate cep" do
    power_generator_product = create(:power_generator, name:"Produto 1", weight: 15)
    city = "01001000"
    freight_table_a = create(:freight, state: "SP", weight_min: 1, weight_max: 9, cost: 1)
    freight_table_b = create(:freight, state: "SP", weight_min: 10, weight_max: 20, cost: 5)
    freight_table_c = create(:freight, state: "SP", weight_min: 21, weight_max: 25, cost: 10)
    freight_table_d = create(:freight, state: "PR", weight_min: 10, weight_max: 20, cost: 8)

    visit power_generator_path(power_generator_product)
    click_on "Calcular frete"
    fill_in "CEP", with: city
    click_on "Calcular"


    expect(current_path).to eq "/power_generators/#{power_generator_product.id}"
    expect(page).to have_content('01001000')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('Sé')
    expect(page).to have_content('SP')
    expect(page).to have_content("#{freight_table_b.cost")
  end
end