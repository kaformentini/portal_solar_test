FactoryBot.define do
  factory :recommended_search do
    lowest_cost { false }
    highest_cost_benefit { false }
    lower_weight { false }
    lower_size { false }
  end
end
