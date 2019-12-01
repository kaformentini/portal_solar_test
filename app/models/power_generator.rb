class PowerGenerator < ApplicationRecord
  validates :name, :description, :image_url, :manufacturer, :price, :kwp, presence: true
  validates :height, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 40 }
  validates :width, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :lenght, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }
  validates :weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3000 }

  enum structure_type: %i[
    metalico
    ceramico
    fibrocimento
    laje
    solo
    trapezoidal
  ]

  def self.search(search)
    return unless search

    where('name LIKE :param or description LIKE :param', param: "%#{search}%")
  end

  def self.freight(address, power_generator)
    freight = Freight.all
    freight.where('state LIKE :state and weight_min <= :weight and weight_max >= :weight', state: "%#{address[:state]}%", weight: "#{power_generator[:weight]}")
  end

  def self.recommended_search
    power_generators.all
    power_generators.where(['price <= ?', 30_000.00]) if lowest_cost.present?
    power_generators.where(['weight <= ?', 200]) if lower_weight.present?
    power_generators.where(['size <= ?', 0.5]) if lower_size.present?
    power_generators.where('name LIKE :param or description LIKE :param', {param: "%#{keyword}%"}) if keyword.present?
    power_generators.where('structure_type = ?', structure_type) if structure_type.present?

    power_generators.order(:price) if lowest_cost.present?
    power_generators.order(:weight) if lower_weight.present?
    power_generators.order(:size) if lower_size.present?
  end
end
