class AddSizeAndCostBenefitToPowerGenerators < ActiveRecord::Migration[5.2]
  def change
    add_column :power_generators, :size, :float
    add_column :power_generators, :cost_benefit, :float
  end
end
