class RecommendedSearch < ApplicationRecord

  def search_power_generators
    power_generators = PowerGenerator.all
    power_generators = power_generators.where(["price <= ?", 30000.00]) if lowest_cost.present?
    

    power_generators = power_generators.order(:price) if lowest_cost.present?
    return power_generators
  end
end
