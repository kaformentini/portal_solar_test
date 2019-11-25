require "rails_helper"

feature "User calculate freight by cep" do
  scenario "successfully" do
    power_generator_product = create(:power_generator, name:"Produto 1")

    visit power_generator_path(power_generator_product)
    click_on "Calcular frete"
    fill_in "CEP", with: "00000-000"

  end
end