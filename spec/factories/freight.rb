FactoryBot.define do
    factory :freight do
      state { "SP" } 
      weight_min { 261.0 }
      weight_max { 270.0 }
			cost { 1345.91 }
    end
  end