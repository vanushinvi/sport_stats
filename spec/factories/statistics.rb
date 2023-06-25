FactoryBot.define do
  factory :statistic do
    player { nil }
    match { nil }
    distance_covered { rand(1..100) }
    pass_accuracy { rand(50.0..100.0).round(2) }
    assists { rand(1..20) }
    goals { rand(1..10) }
  end
end
