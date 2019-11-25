class RecommendedSearch < ApplicationRecord

  def search_power_generators
    power_generators = PowerGenerator.all
    power_generators = power_generators.where(["price <= ?", 30000.00]) if lowest_cost.present?
    power_generators = power_generators.where(["weight <= ?", 200]) if lower_weight.present?
    power_generators = power_generators.where(["size <= ?", 0.5]) if lower_size.present?
    power_generators = power_generators.where("name LIKE :param or description LIKE :param", {param: "%#{keyword}%"}) if keyword.present?
    power_generators = power_generators.where("structure_type = ?", structure_type) if structure_type.present?


    power_generators = power_generators.order(:price) if lowest_cost.present?
    power_generators = power_generators.order(:weight) if lower_weight.present?
    power_generators = power_generators.order(:size) if lower_size.present?
    return power_generators
  end

end
