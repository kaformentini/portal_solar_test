require 'rails_helper'

feature 'Index have just six products per page' do
  scenario 'successfully' do
    power_generators = ['PRODUTO 1', 'PRODUTO 2', 'PRODUTO 3',
                        'PRODUTO 4', 'PRODUTO 5', 'PRODUTO 6',
                        'PRODUTO 7']

    power_generators = power_generators.map { |x| create(:power_generator, name: x) }

    visit root_path

    expect(page).to have_content(power_generators[0].name)
    expect(page).to have_content(power_generators[1].name)
    expect(page).to have_content(power_generators[2].name)
    expect(page).to have_content(power_generators[3].name)
    expect(page).to have_content(power_generators[4].name)
    expect(page).to have_content(power_generators[5].name)
    expect(page).not_to have_content(power_generators[6].name)
  end

  scenario 'successfully secund page have more products' do
    power_generators = ['PRODUTO 1', 'PRODUTO 2', 'PRODUTO 3',
                        'PRODUTO 4', 'PRODUTO 5', 'PRODUTO 6',
                        'PRODUTO 7']

    power_generators = power_generators.map { |x| create(:power_generator, name: x) }

    visit root_path
    click_on 'Próxima página'

    expect(page).not_to have_content(power_generators[0].name)
    expect(page).not_to have_content(power_generators[1].name)
    expect(page).not_to have_content(power_generators[2].name)
    expect(page).not_to have_content(power_generators[3].name)
    expect(page).not_to have_content(power_generators[4].name)
    expect(page).not_to have_content(power_generators[5].name)
    expect(page).to have_content(power_generators[6].name)
  end

  scenario 'successfully secund page have more products' do
    power_generators = ['PRODUTO 1', 'PRODUTO 2', 'PRODUTO 3',
                        'PRODUTO 4', 'PRODUTO 5', 'PRODUTO 6',
                        'PRODUTO 7']

    power_generators = power_generators.map { |x| create(:power_generator, name: x) }

    visit root_path
    click_on 'Próxima página'
    click_on 'Voltar página'

    expect(page).to have_content(power_generators[0].name)
    expect(page).to have_content(power_generators[1].name)
    expect(page).to have_content(power_generators[2].name)
    expect(page).to have_content(power_generators[3].name)
    expect(page).to have_content(power_generators[4].name)
    expect(page).to have_content(power_generators[5].name)
    expect(page).not_to have_content(power_generators[6].name)
  end
end
