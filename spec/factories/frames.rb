FactoryBot.define do
  factory :frame do
    score { 0 }
    first_roll { false }
    second_roll { false }
    association :game
  end
end
