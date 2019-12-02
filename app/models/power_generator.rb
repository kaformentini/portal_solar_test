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

  def self.recommended_search(params)
    search = all
    search = where(['price <= ?', 30_000.00]) if params[:lowest_cost].present?
    search = where(['weight <= ?', 200]) if params[:lower_weight].present?
    search = where(['size <= ?', 0.5]) if params[:lower_size].present?
    search = where('name LIKE :param or description LIKE :param', {param: "%#{params[:keyword]}%"}) if not params[:keyword].nil?
    search = where('structure_type = ?', params[:structure_type]) if not params[:structure_type].nil?

    search = order(:price) if params[:lowest_cost].present?
    search = order(:weight) if params[:lower_weight].present?
    search = order(:size) if params[:lower_size].present?
  end
end
