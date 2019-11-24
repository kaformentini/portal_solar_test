class CreateRecommendedSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :recommended_searches do |t|
      t.boolean :lowest_cost
      t.boolean :highest_cost_benefit
      t.boolean :lower_weight
      t.boolean :lower_size

      t.timestamps
    end
  end
end
