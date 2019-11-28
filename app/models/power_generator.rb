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
    if search
      where("name LIKE :param or description LIKE :param", {param: "%#{search}%"})
    end
  end

  def self.freight(address, power_generator)
    freight = Freight.all
    return freight.where("state LIKE :state and weight_min <= :weight and weight_max >= :weight", {state: "%#{address[:state]}%", weight: "#{power_generator[:weight]}"})
  end

end
